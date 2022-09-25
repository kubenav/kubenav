import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xterm/ui.dart' as xtermui;
import 'package:xterm/xterm.dart' as xterm;

import 'package:kubenav/controllers/terminal_controller.dart';
import 'package:kubenav/models/terminal_model.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';

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

Color getColor(int index) {
  return colors[index % colors.length];
}

class AppTerminalsController extends GetxController {
  TerminalController terminalController = Get.find();
}

class AppTerminalsWidget extends StatelessWidget {
  const AppTerminalsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppTerminalsController controller = Get.put(
      AppTerminalsController(),
    );

    return SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.75,
        color: Colors.transparent,
        child: Container(
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
                            decoration: const BoxDecoration(
                              color: Constants.colorPrimary,
                              borderRadius: BorderRadius.all(
                                Radius.circular(Constants.sizeBorderRadius),
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
                                Obx(() {
                                  return Text(
                                    Characters(
                                      'You have ${controller.terminalController.terminals.length} Terminals open',
                                    )
                                        .replaceAll(Characters(''),
                                            Characters('\u{200B}'))
                                        .toString(),
                                    overflow: TextOverflow.ellipsis,
                                    style: secondaryTextStyle(
                                      context,
                                    ),
                                  );
                                }),
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
                        finish(context);
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
                child: Obx(
                  () {
                    return DefaultTabController(
                      length: controller.terminalController.terminals.length,
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(Constants.sizeBorderRadius),
                            ),
                            child: TabBar(
                              isScrollable: true,
                              labelColor: Colors.white,
                              unselectedLabelColor: Constants.colorPrimary,
                              indicatorSize: TabBarIndicatorSize.tab,
                              indicator: const BoxDecoration(
                                color: Constants.colorPrimary,
                              ),
                              tabs: controller.terminalController.terminals
                                  .asMap()
                                  .entries
                                  .map(
                                (terminal) {
                                  return Tab(
                                    child: GestureDetector(
                                      onLongPress: () {
                                        controller.terminalController
                                            .removeTerminal(
                                                context, terminal.key);
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
                          const SizedBox(height: Constants.spacingMiddle),
                          Expanded(
                            child: TabBarView(
                              children: controller.terminalController.terminals
                                  .asMap()
                                  .entries
                                  .map(
                                (terminal) {
                                  return terminal.value.type ==
                                          TerminalType.exec
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
                    );
                  },
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
