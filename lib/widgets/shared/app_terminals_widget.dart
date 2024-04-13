import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:xterm/ui.dart' as xtermui;
import 'package:xterm/xterm.dart' as xterm;

import 'package:kubenav/repositories/app_repository.dart';
import 'package:kubenav/repositories/terminal_repository.dart';
import 'package:kubenav/repositories/theme_repository.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';

/// [getColor] returns the correct color from the [colors] list for the provided
/// [index].
Color getColor(int index, List<Color> colors) {
  return colors[index % colors.length];
}

class AppTerminalsWidget extends StatelessWidget {
  const AppTerminalsWidget({super.key});

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
                              color: theme(context).primary,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(
                                  Constants.sizeBorderRadius,
                                ),
                              ),
                            ),
                            height: 54,
                            width: 54,
                            child: Icon(
                              Icons.terminal,
                              color: theme(context).onPrimary,
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
                                      .replaceAll(
                                        Characters(''),
                                        Characters('\u{200B}'),
                                      )
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
                            labelColor: theme(context).onPrimary,
                            unselectedLabelColor: theme(context).primary,
                            indicatorSize: TabBarIndicatorSize.tab,
                            indicator: BoxDecoration(
                              color: theme(context).primary,
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
                                          theme: theme(context).terminalTheme,
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
                                              theme:
                                                  theme(context).terminalTheme,
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
                                            color: theme(context).background,
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
                                                            color: getColor(
                                                              e.key,
                                                              theme(context)
                                                                  .logsTheme,
                                                            ),
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
