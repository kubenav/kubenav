import 'package:flutter/material.dart';
import 'package:kubenav/utils/showmodal.dart';
import 'package:kubenav/widgets/shared/app_actions_widget.dart';

import 'package:provider/provider.dart';
import 'package:xterm/ui.dart' as xtermui;
import 'package:xterm/xterm.dart' as xterm;

import 'package:kubenav/repositories/terminal_repository.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/utils/themes.dart';

/// [getColor] returns the correct color from the [colors] list for the provided
/// [index].
Color getColor(int index, List<Color> colors) {
  return colors[index % colors.length];
}

class AppTerminalsActionsWidget extends StatelessWidget {
  const AppTerminalsActionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    TerminalRepository terminalRepository = Provider.of<TerminalRepository>(
      context,
      listen: true,
    );

    return AppActionsWidget(
      actions: List.generate(
        terminalRepository.terminals.length,
        (index) => AppActionsWidgetAction(
          title:
              '${terminalRepository.terminals[index].type.toLocalizedString()}: ${terminalRepository.terminals[index].name}',
          color: Theme.of(context).colorScheme.primary,
          onTap: () {
            Navigator.pop(context);
            showActions(
              context,
              AppTerminalActionsWidget(
                terminalIndex: index,
              ),
            );
          },
        ),
      ),
    );
  }
}

class AppTerminalActionsWidget extends StatelessWidget {
  const AppTerminalActionsWidget({
    super.key,
    required this.terminalIndex,
  });

  final int terminalIndex;

  @override
  Widget build(BuildContext context) {
    TerminalRepository terminalRepository = Provider.of<TerminalRepository>(
      context,
      listen: true,
    );

    return AppActionsWidget(
      actions: [
        AppActionsWidgetAction(
          title: 'Open',
          color: Theme.of(context).colorScheme.primary,
          onTap: () {
            Navigator.pop(context);
            showModal(
              context,
              AppTerminalWidget(
                terminalIndex: terminalIndex,
              ),
            );
          },
        ),
        AppActionsWidgetAction(
          title: 'Delete',
          color: Theme.of(context).extension<CustomColors>()!.error,
          onTap: () {
            terminalRepository.deleteTerminal(terminalIndex);
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}

class AppTerminalWidget extends StatelessWidget {
  const AppTerminalWidget({
    super.key,
    required this.terminalIndex,
  });

  final int terminalIndex;

  /// [_buildContent] returns the content for the terminal, depending on the
  /// [TerminalType].
  Widget _buildContent(BuildContext context) {
    TerminalRepository terminalRepository = Provider.of<TerminalRepository>(
      context,
      listen: false,
    );

    if (terminalRepository.terminals[terminalIndex].type == TerminalType.exec) {
      if (terminalRepository.terminals[terminalIndex].terminal != null) {
        return Padding(
          padding: const EdgeInsets.only(
            left: Constants.spacingMiddle,
            right: Constants.spacingMiddle,
          ),
          child: xtermui.TerminalView(
            terminalRepository.terminals[terminalIndex].terminal!.terminal,
            padding: const EdgeInsets.only(
              top: Constants.spacingMiddle,
              bottom: Constants.spacingMiddle,
              left: Constants.spacingSmall,
              right: Constants.spacingSmall,
            ),
            theme: Theme.of(context).extension<TerminalColors>()!.getTheme(),
            textStyle: xterm.TerminalStyle(
              fontSize: 14,
              fontFamily: getMonospaceFontFamily(),
            ),
          ),
        );
      }

      return Container();
    }

    if (terminalRepository.terminals[terminalIndex].type ==
        TerminalType.logstream) {
      if (terminalRepository.terminals[terminalIndex].logstream != null) {
        return Padding(
          padding: const EdgeInsets.only(
            left: Constants.spacingMiddle,
            right: Constants.spacingMiddle,
          ),
          child: xtermui.TerminalView(
            terminalRepository.terminals[terminalIndex].logstream!.terminal,
            padding: const EdgeInsets.only(
              top: Constants.spacingMiddle,
              bottom: Constants.spacingMiddle,
              left: Constants.spacingSmall,
              right: Constants.spacingSmall,
            ),
            theme: Theme.of(context).extension<TerminalColors>()!.getTheme(),
            textStyle: xterm.TerminalStyle(
              fontSize: 14,
              fontFamily: getMonospaceFontFamily(),
            ),
          ),
        );
      }

      return Container();
    }

    if (terminalRepository.terminals[terminalIndex].type == TerminalType.log) {
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: Constants.spacingMiddle,
            bottom: Constants.spacingMiddle,
            left: Constants.spacingMiddle,
            right: Constants.spacingMiddle,
          ),
          child: Container(
            padding: const EdgeInsets.all(Constants.spacingSmall),
            color: Theme.of(context).extension<TerminalColors>()!.background,
            child: Wrap(
              children: terminalRepository.terminals[terminalIndex].logs == null
                  ? []
                  : terminalRepository.terminals[terminalIndex].logs!
                      .asMap()
                      .entries
                      .map(
                        (e) => SelectableText(
                          e.value.join('\n\n'),
                          style: TextStyle(
                            color: getColor(
                              e.key,
                              Theme.of(context)
                                  .extension<LogColors>()!
                                  .getTheme(),
                            ),
                            fontSize: 14,
                            fontFamily: getMonospaceFontFamily(),
                          ),
                        ),
                      )
                      .toList(),
            ),
          ),
        ),
      );
    }

    return Container();
  }

  /// [_buildIcon] return the icon for the terminal, if the [TerminalType] is
  /// `log` or `logstream` the icon for logs is returned. If the [TerminalType]
  /// is `exec` the icon for a terminal is returned.
  Widget _buildIcon(BuildContext context) {
    TerminalRepository terminalRepository = Provider.of<TerminalRepository>(
      context,
      listen: false,
    );

    if (terminalRepository.terminals[terminalIndex].type == TerminalType.exec) {
      return Icon(
        Icons.list,
        color: Theme.of(context).colorScheme.onPrimary,
        size: 36,
      );
    }

    if (terminalRepository.terminals[terminalIndex].type == TerminalType.log ||
        terminalRepository.terminals[terminalIndex].type ==
            TerminalType.logstream) {
      return Icon(
        Icons.subject,
        color: Theme.of(context).colorScheme.onPrimary,
        size: 36,
      );
    }

    return Container();
  }

  @override
  Widget build(BuildContext context) {
    TerminalRepository terminalRepository = Provider.of<TerminalRepository>(
      context,
      listen: true,
    );

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(
                top: Constants.spacingMiddle,
                bottom: Constants.spacingMiddle,
                left: Constants.spacingMiddle,
                right: Constants.spacingMiddle,
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
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(Constants.sizeBorderRadius),
                            ),
                          ),
                          height: 54,
                          width: 54,
                          child: _buildIcon(context),
                        ),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                terminalRepository.terminals[terminalIndex].type
                                    .toLocalizedString(),
                                overflow: TextOverflow.ellipsis,
                                style: primaryTextStyle(
                                  context,
                                  size: 18,
                                ),
                              ),
                              Text(
                                Characters(
                                  terminalRepository
                                      .terminals[terminalIndex].name,
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
                    icon: Icon(
                      Icons.close_outlined,
                      color: Theme.of(context)
                          .extension<CustomColors>()!
                          .textPrimary,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: Constants.spacingMiddle,
                right: Constants.spacingMiddle,
              ),
              child: Divider(
                height: 0,
                thickness: 1.0,
              ),
            ),
            const SizedBox(height: Constants.spacingMiddle),
            Expanded(
              child: _buildContent(context),
            ),
            const SizedBox(height: Constants.spacingMiddle),
          ],
        ),
      ),
    );
  }
}
