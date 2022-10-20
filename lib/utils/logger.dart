import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/widgets/app_bottom_sheet_widget.dart';

/// [Logger] is our custom log implementation, which allows us to log messages to the console and to access the logs via
/// the app. So that a user can share the logs when he encountered a problem within the app.
class Logger extends StatelessWidget {
  const Logger({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBottomSheetWidget(
      title: 'Logs',
      subtitle: 'Debug logs for kubenav',
      icon: Icons.subject,
      onClosePressed: () {
        finish(context);
      },
      actionText: 'Copy',
      onActionPressed: () {
        Clipboard.setData(
          ClipboardData(
            text: _Log.list.map((e) => e.toString()).join('\n\n'),
          ),
        );
        finish(context);
      },
      child: Form(
        key: const Key('settings/license'),
        child: ListView(
          shrinkWrap: false,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8,
              ),
              child: SelectableText(
                _Log.list.map((e) => e.toString()).join('\n\n'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static void log(String name, String message, [dynamic detail]) {
    _Log.add(name, message, detail);
  }

  static void clear() {
    _Log.clear();
  }
}

class _Log {
  static final List<_Log> list = [];
  static final ValueNotifier<int> length = ValueNotifier(0);
  static final Map<Object, Object> _map = {};

  final String name;
  final String message;
  final String? detail;
  final DateTime time;

  const _Log({
    required this.name,
    required this.message,
    this.detail,
    required this.time,
  });

  @override
  String toString() {
    final StringBuffer sb = StringBuffer();
    sb.writeln('Time: $time');
    sb.writeln('Name: $name');
    sb.writeln('Message: $message');
    sb.writeln(
      'Detail: ${detail != null ? detail!.substring(0, detail.toString().length > 255 ? 255 : null) : '-'}',
    );

    return sb.toString();
  }

  static void add(String name, String message, dynamic detail) {
    final log = _Log(
      name: name,
      message: message,
      detail: detail?.toString(),
      time: DateTime.now(),
    );
    list.add(log);
    _clearWhenTooMuch();
    length.value++;

    debugPrint(
      '[${log.time}] [${log.name}] ${log.message}${log.detail == null ? '' : '\n${log.detail.toString().substring(0, log.detail.toString().length > 255 ? 255 : null)}'}\n--------------------------------',
    );
  }

  static void _clearWhenTooMuch() {
    if (list.length > 100) {
      list.removeRange(0, (100 * 0.2).ceil());
    }
  }

  static void clear() {
    list.clear();
    _map.clear();
    length.value = 0;
  }
}
