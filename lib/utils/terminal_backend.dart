import 'dart:convert';
import 'dart:io';

import 'package:web_socket_channel/io.dart';
import 'package:xterm/core.dart' as xtermcore;
import 'package:xterm/xterm.dart' as xterm;

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
              : Platform.isMacOS
                  ? xtermcore.TerminalTargetPlatform.macos
                  : Platform.isLinux
                      ? xtermcore.TerminalTargetPlatform.linux
                      : Platform.isWindows
                          ? xtermcore.TerminalTargetPlatform.windows
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
      channel.sink.add(TerminalData(
        op: 'resize',
        data: '',
        rows: height,
        cols: width,
      ).toString());

      // channel.sink.add('{"Cols": $width, "Op": "resize", "Rows": $height}');
    };

    terminal.onOutput = (data) {
      channel.sink.add(TerminalData(
        op: 'stdin',
        data: data,
        rows: 0,
        cols: 0,
      ).toString());

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
