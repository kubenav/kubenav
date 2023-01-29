import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:xterm/ui.dart' as xtermui;
import 'package:xterm/xterm.dart' as xterm;

import 'package:kubenav/repositories/app_repository.dart';
import 'package:kubenav/repositories/terminal_repository.dart';
import 'package:kubenav/repositories/theme_repository.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';

/// [colors] is a list of all supported text colors of our terminal.
List<Color> colors = [
  const Color(0xffD8DEE9),
  const Color(0xff81A1C1),
  const Color(0xffB48EAD),
  const Color(0xff8FBCBB),
  const Color(0xffEBCB8B),
  const Color(0xff88C0D0),
  const Color(0xffA3BE8C),
  const Color(0xff5E81AC),
];

/// [terminalTheme] is the theme for our terminal. These are the same colors as
/// used the awesome Nord theme (https://www.nordtheme.com) which is currently
/// my favorite theme.
const xterm.TerminalTheme terminalTheme = xterm.TerminalTheme(
  cursor: Color(0xffd8dee9),
  selection: Color(0xff4c566a),
  foreground: Color(0xffd8dee9),
  background: Color(0xff2e3440),
  black: Color(0xff3b4251),
  red: Color(0xffbf6069),
  green: Color(0xffa3be8b),
  yellow: Color(0xffeacb8a),
  blue: Color(0xff81a1c1),
  magenta: Color(0xffb48dac),
  cyan: Color(0xff88c0d0),
  white: Color(0xffe5e9f0),
  brightBlack: Color(0xff4c556a),
  brightRed: Color(0xffbf6069),
  brightGreen: Color(0xffa3be8b),
  brightYellow: Color(0xffeacb8a),
  brightBlue: Color(0xff81a1c1),
  brightMagenta: Color(0xffb48dac),
  brightCyan: Color(0xff8fbcbb),
  brightWhite: Color(0xffeceef4),
  searchHitBackground: Color(0xffeacb8a),
  searchHitBackgroundCurrent: Color(0xffeacb8a),
  searchHitForeground: Color(0xff2e3440),
);

/// [getColor] returns the correct color from the [colors] list for the provided
/// [index].
Color getColor(int index) {
  return colors[index % colors.length];
}

class AppTerminalsWidget extends StatelessWidget {
  const AppTerminalsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppRepository appRepository = Provider.of<AppRepository>(
      context,
      listen: false,
    );
    TerminalRepository terminalRepository = Provider.of<TerminalRepository>(
      context,
      listen: true,
    );

    final isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom != 0;

    return Container(
      height: MediaQuery.of(context).size.height *
          (isKeyboardVisible
              ? 1
              : appRepository.settings.fullHeightModals
                  ? 1
                  : 0.75),
      color: Colors.transparent,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          padding: const EdgeInsets.only(
            left: Constants.spacingMiddle,
            right: Constants.spacingMiddle,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(
                  top: Constants.spacingMiddle,
                  bottom: Constants.spacingMiddle,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                              right: Constants.spacingMiddle,
                            ),
                            padding: const EdgeInsets.all(
                              Constants.spacingExtraSmall,
                            ),
                            decoration: BoxDecoration(
                              color: theme(context).colorPrimary,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(
                                  Constants.sizeBorderRadius,
                                ),
                              ),
                            ),
                            height: 54,
                            width: 54,
                            child: const Icon(
                              Icons.terminal,
                              color: Colors.white,
                              size: 36,
                            ),
                          ),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Terminals',
                                  overflow: TextOverflow.ellipsis,
                                  style: primaryTextStyle(
                                    context,
                                    size: 18,
                                  ),
                                ),
                                Text(
                                  Characters(
                                    'You have ${terminalRepository.terminals.length} Terminals open',
                                  )
                                      .replaceAll(Characters(''),
                                          Characters('\u{200B}'))
                                      .toString(),
                                  overflow: TextOverflow.ellipsis,
                                  style: secondaryTextStyle(
                                    context,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.close_outlined,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
              const Divider(
                height: 0,
                thickness: 1.0,
              ),
              const SizedBox(height: Constants.spacingMiddle),
              Flexible(
                child: DefaultTabController(
                  length: terminalRepository.terminals.length,
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(Constants.sizeBorderRadius),
                        ),
                        child: SizedBox(
                          height: 32,
                          child: TabBar(
                            isScrollable: true,
                            labelColor: Colors.white,
                            unselectedLabelColor: theme(context).colorPrimary,
                            indicatorSize: TabBarIndicatorSize.tab,
                            indicator: BoxDecoration(
                              color: theme(context).colorPrimary,
                            ),
                            tabs: terminalRepository.terminals
                                .asMap()
                                .entries
                                .map(
                              (terminal) {
                                return Tab(
                                  child: GestureDetector(
                                    onDoubleTap: () {
                                      terminalRepository.deleteTerminal(
                                        terminal.key,
                                      );
                                      if (terminalRepository
                                          .terminals.isEmpty) {
                                        Navigator.pop(context);
                                      }
                                    },
                                    child: Text(
                                      terminal.value.name,
                                    ),
                                  ),
                                );
                              },
                            ).toList(),
                          ),
                        ),
                      ),
                      const SizedBox(height: Constants.spacingMiddle),
                      Expanded(
                        child: TabBarView(
                          children:
                              terminalRepository.terminals.asMap().entries.map(
                            (terminal) {
                              return terminal.value.type == TerminalType.exec
                                  ? terminal.value.terminal != null
                                      ? xtermui.TerminalView(
                                          terminal.value.terminal!.terminal,
                                          theme: terminalTheme,
                                          textStyle: xterm.TerminalStyle(
                                            fontSize: 14,
                                            fontFamily:
                                                getMonospaceFontFamily(),
                                          ),
                                        )
                                      : Container()
                                  : terminal.value.type ==
                                          TerminalType.logstream
                                      ? terminal.value.logstream != null
                                          ? xtermui.TerminalView(
                                              terminal
                                                  .value.logstream!.terminal,
                                              theme: terminalTheme,
                                              textStyle: xterm.TerminalStyle(
                                                fontSize: 14,
                                                fontFamily:
                                                    getMonospaceFontFamily(),
                                              ),
                                            )
                                          : Container()
                                      : SingleChildScrollView(
                                          physics:
                                              const ClampingScrollPhysics(),
                                          child: Container(
                                            padding: const EdgeInsets.all(
                                              Constants.spacingSmall,
                                            ),
                                            color: const Color(0xff2E3440),
                                            child: Wrap(
                                              children: terminal.value.logs ==
                                                      null
                                                  ? []
                                                  : terminal.value.logs!
                                                      .asMap()
                                                      .entries
                                                      .map(
                                                        (e) => SelectableText(
                                                          e.value.join('\n\n'),
                                                          style: TextStyle(
                                                            color:
                                                                getColor(e.key),
                                                            fontSize: 14,
                                                            fontFamily:
                                                                getMonospaceFontFamily(),
                                                          ),
                                                        ),
                                                      )
                                                      .toList(),
                                            ),
                                          ),
                                        );
                            },
                          ).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: Constants.spacingMiddle),
            ],
          ),
        ),
      ),
    );
  }
}
