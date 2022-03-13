import 'package:xterm/xterm.dart' as xterm;

/// [TerminalType] is a `enum`, which defines if a terminal is used to show logs or for connection to a container.
enum TerminalType {
  log,
  exec,
}

/// A [Terminal] represents a single terminal. A terminal can be used to show the logs of a container or to exec into a
/// container.
class Terminal {
  TerminalType type;
  String name;
  List<dynamic>? logs;
  xterm.Terminal? terminal;

  Terminal({
    required this.type,
    required this.name,
    this.logs,
    this.terminal,
  });
}
