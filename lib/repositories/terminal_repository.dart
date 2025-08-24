import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:web_socket_channel/io.dart';
import 'package:xterm/core.dart' as xtermcore;
import 'package:xterm/xterm.dart' as xterm;

/// [TerminalType] is a `enum`, which defines if a terminal is used to show logs or for connection to a container.
enum TerminalType { log, logstream, exec }

extension TerminalTypeExtension on TerminalType {
  /// [toLocalizedString] returns a localized string for a source type.
  String toLocalizedString() {
    switch (this) {
      case TerminalType.log:
        return 'Logs';
      case TerminalType.logstream:
        return 'Logs Stream';
      case TerminalType.exec:
        return 'Terminal';
    }
  }
}

/// A [Terminal] represents a single terminal. A terminal can be used to show the logs of a container or to exec into a
/// container.
class Terminal {
  TerminalType type;
  String name;
  List<dynamic>? logs;
  LogStreamBackend? logstream;
  TerminalBackend? terminal;

  Terminal({
    required this.type,
    required this.name,
    this.logs,
    this.logstream,
    this.terminal,
  });
}

/// [TerminalData] is the format of the messages send over the WebSocket connection for a terminal. If contains an
/// [op]eration, the [data] which is send and if [op] is `resize` the [rows] and [cols].
class TerminalData {
  String op;
  String data;
  int rows;
  int cols;

  TerminalData({
    required this.op,
    required this.data,
    required this.rows,
    required this.cols,
  });

  factory TerminalData.fromJson(Map<String, dynamic> json) => TerminalData(
    op: json['Op'],
    data: json['Data'],
    rows: json['Rows'],
    cols: json['Cols'],
  );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = <String, dynamic>{};
    jsonData['Op'] = op;
    jsonData['Data'] = data;
    jsonData['Rows'] = rows;
    jsonData['Cols'] = cols;
    return jsonData;
  }

  @override
  String toString() {
    return json.encode(toJson());
  }
}

/// [TerminalBackend] contains the websocket connection and return the xterm terminal and the [terminalController] for
/// our terminal. It listens for messages on the WebSocket connection and writes all the receives messages to the
/// terminal. It also sends the user input over the WebSocket connection to our internal http server and handles the
/// resizing of the terminal.
///
/// When the terminal is closed we have to manually call `terminate()` to close the underlying WebSocket connection.
class TerminalBackend {
  late xterm.Terminal terminal;
  late IOWebSocketChannel channel;

  TerminalBackend(IOWebSocketChannel c) {
    channel = c;

    terminal = xterm.Terminal(
      maxLines: 10000,
      platform: Platform.isAndroid
          ? xtermcore.TerminalTargetPlatform.android
          : Platform.isIOS
          ? xtermcore.TerminalTargetPlatform.ios
          : xtermcore.TerminalTargetPlatform.unknown,
    );

    channel.stream.listen(
      (data) {
        final parsedData = TerminalData.fromJson(json.decode(data));
        terminal.write(parsedData.data);
      },
      onError: (error) {
        terminal.write('Error: $error');
      },
      onDone: () {
        terminal.write('The process exited');
      },
    );

    terminal.onResize = (width, height, pixelWidth, pixelHeight) {
      channel.sink.add(
        TerminalData(
          op: 'resize',
          data: '',
          rows: height,
          cols: width,
        ).toString(),
      );

      // channel.sink.add('{"Cols": $width, "Op": "resize", "Rows": $height}');
    };

    terminal.onOutput = (data) {
      channel.sink.add(
        TerminalData(op: 'stdin', data: data, rows: 0, cols: 0).toString(),
      );

      // if (data == '\r') {
      //   channel.sink.add('{"Data": "\\r", "Op": "stdin"}');
      // } else if (data.codeUnitAt(0) == 27 && Platform.isIOS) {
      //   // Here we are ignoring when the data is "27", because when we are on iOS this breaks the backspace support. It
      //   // seems that when a user presses the backspace key it triggers the data two time. The first time it sends "27"
      //   // and the second time "127" which is the correct code. So that we always ignore the first one.
      // } else {
      //   channel.sink.add('{"Data": "$data", "Op": "stdin"}');
      // }
    };
  }

  void terminate() {
    channel.sink.close();
  }
}

/// The [LogStreamBackend] is the backend to stream the logs of a container. It
/// container the WebSocket [channel] over which we send the logs from our Go
/// code to the Flutter code. It also container a [terminal] which is used to
/// write all received logs from the WebSocket connection. The [terminal] can
/// then be used to show the logs in widget.
class LogStreamBackend {
  late xterm.Terminal terminal;
  late IOWebSocketChannel channel;

  LogStreamBackend(IOWebSocketChannel c) {
    channel = c;

    terminal = xterm.Terminal(
      maxLines: 10000,
      platform: Platform.isAndroid
          ? xtermcore.TerminalTargetPlatform.android
          : Platform.isIOS
          ? xtermcore.TerminalTargetPlatform.ios
          : xtermcore.TerminalTargetPlatform.unknown,
    );

    channel.stream.listen(
      (data) {
        terminal.write('$data\n\r\n\r');
      },
      onError: (error) {
        terminal.write('Error: $error');
      },
      onDone: () {
        terminal.write('The process exited');
      },
    );
  }

  void terminate() {
    channel.sink.close();
  }
}

/// The [TerminalRepository] contains all [_terminals] which were create by a
/// user.
class TerminalRepository with ChangeNotifier {
  final List<Terminal> _terminals = <Terminal>[];

  List<Terminal> get terminals => _terminals;

  /// [addTerminal] adds a new terminal to the repository and returns the index
  /// of the added terminal.
  int addTerminal(
    TerminalType type,
    String name,
    List<dynamic>? logs,
    LogStreamBackend? logstream,
    TerminalBackend? terminal,
  ) {
    _terminals.add(
      Terminal(
        type: type,
        name: name,
        logs: logs,
        logstream: logstream,
        terminal: terminal,
      ),
    );
    notifyListeners();
    return _terminals.length - 1;
  }

  /// [deleteTerminal] deletes the terminal with the provided [index]. If the
  /// terminal has an [TerminalBackend] or [LogStreamBackend] we also call the
  /// `terminate` method of the backend to close the WebSocket connection.
  void deleteTerminal(int index) {
    if (_terminals[index].terminal != null) {
      _terminals[index].terminal!.terminate();
    }

    if (_terminals[index].logstream != null) {
      _terminals[index].logstream!.terminate();
    }

    _terminals.removeAt(index);
    notifyListeners();
  }
}
