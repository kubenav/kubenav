import 'dart:async';
import 'dart:convert';
import 'dart:io' show Platform;

import 'package:web_socket_channel/io.dart';
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
}

/// [TerminalBackend] is the `TerminalBackend` implementation. It listens for messages on the WebSocket connection and
/// writes all the receives messages to the terminal. It also sends the user input over the WebSocket connection to our
/// internal http server and handles the resizing of the terminal.
///
/// When the terminal is closed we have to manually call `terminateBackend()`, to terminate the backend and to close the
/// underlying WebSocket connection.
class TerminalBackend extends xterm.TerminalBackend {
  IOWebSocketChannel channel;

  final _exitCodeCompleter = Completer<int>();
  final _outStream = StreamController<String>();

  TerminalBackend({
    required this.channel,
  });

  void onWrite(String data) {
    _outStream.sink.add(data);
  }

  @override
  Future<int> get exitCode => _exitCodeCompleter.future;

  @override
  void init() {
    channel.stream.listen((data) {
      final parsedData = TerminalData.fromJson(json.decode(data));
      onWrite(parsedData.data);
    }, onError: (error) {
      onWrite('Error: $error');
    });
  }

  @override
  Stream<String> get out => _outStream.stream;

  @override
  void resize(int width, int height, int pixelWidth, int pixelHeight) {
    channel.sink.add('{"Cols": $width, "Op": "resize", "Rows": $height}');
  }

  @override
  void write(String input) {
    if (input == '\r') {
      channel.sink.add('{"Data": "\\r", "Op": "stdin"}');
    } else if (input.codeUnitAt(0) == 27 && Platform.isIOS) {
      // Here we are ignoring when the input is "27", because when we are on iOS this breaks the backspace support. It
      // seems that when a user presses the backspace key it triggers the input two time. The first time it sends "27"
      // and the second time "127" which is the correct code. So that we always ignore the first one.
    } else {
      channel.sink.add('{"Data": "$input", "Op": "stdin"}');
    }
  }

  @override
  void terminate() {
    channel.sink.close();
  }

  @override
  void ackProcessed() {}
}
