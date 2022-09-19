import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:kubenav/controllers/global_settings_controller.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/custom_icons.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/widgets/app_vertical_list_simple_widget.dart';

class SettingsWidget extends StatelessWidget {
  const SettingsWidget({
    Key? key,
  }) : super(key: key);

  List<AppVertialListSimpleModel> buildItems(
      BuildContext context, GlobalSettingsController globalSettingsController) {
    final List<AppVertialListSimpleModel> items = [];

    if (Platform.isAndroid || Platform.isIOS) {
      items.add(
        AppVertialListSimpleModel(
          onTap: () {
            Get.toNamed('/settings/providers');
          },
          children: [
            const Icon(
              CustomIcons.kubernetes,
              color: Constants.colorPrimary,
            ),
            const SizedBox(width: Constants.spacingSmall),
            Expanded(
              flex: 1,
              child: Text(
                'Provider Configurations',
                style: noramlTextStyle(
                  context,
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey[300],
              size: 16,
            ),
          ],
        ),
      );
    }

    items.add(
      AppVertialListSimpleModel(
        onTap: () {
          Get.toNamed('/settings/namespaces');
        },
        children: [
          const Icon(
            CustomIcons.namespaces,
            color: Constants.colorPrimary,
          ),
          const SizedBox(width: Constants.spacingSmall),
          Expanded(
            flex: 1,
            child: Text(
              'Namespaces',
              style: noramlTextStyle(
                context,
              ),
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: Colors.grey[300],
            size: 16,
          ),
        ],
      ),
    );

    if (Platform.isAndroid || Platform.isIOS) {
      items.add(
        AppVertialListSimpleModel(
          children: [
            const Icon(
              Icons.fingerprint,
              color: Constants.colorPrimary,
            ),
            const SizedBox(width: Constants.spacingSmall),
            Expanded(
              flex: 1,
              child: Text(
                'Authentication',
                style: noramlTextStyle(
                  context,
                ),
              ),
            ),
            Obx(
              () => Switch(
                activeColor: Constants.colorPrimary,
                onChanged: (val) =>
                    globalSettingsController.toogleAuthentication(),
                value: globalSettingsController.isAuthenticationEnabled.value,
              ),
            )
          ],
        ),
      );
    }

    items.add(
      AppVertialListSimpleModel(
        children: [
          const Icon(
            Icons.dark_mode,
            color: Constants.colorPrimary,
          ),
          const SizedBox(width: Constants.spacingSmall),
          Expanded(
            flex: 1,
            child: Text(
              'Dark Mode',
              style: noramlTextStyle(
                context,
              ),
            ),
          ),
          Obx(
            () => Switch(
              activeColor: Constants.colorPrimary,
              onChanged: (val) => globalSettingsController.isDarkTheme.value =
                  !globalSettingsController.isDarkTheme.value,
              value: globalSettingsController.isDarkTheme.value,
            ),
          )
        ],
      ),
    );

    items.add(
      AppVertialListSimpleModel(
        children: [
          const Icon(
            Icons.code,
            color: Constants.colorPrimary,
          ),
          const SizedBox(width: Constants.spacingSmall),
          Expanded(
            flex: 1,
            child: Text(
              'Editor Format',
              style: noramlTextStyle(
                context,
              ),
            ),
          ),
          Obx(
            () => DropdownButton(
              value: globalSettingsController.editorFormat.value,
              underline: Container(
                height: 2,
                color: Constants.colorPrimary,
              ),
              onChanged: (String? newValue) {
                globalSettingsController.editorFormat.value = newValue ?? '';
              },
              items: [
                'yaml',
                'json',
              ].map((value) {
                return DropdownMenuItem(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(
                      color: Theme.of(context).textTheme.displayMedium!.color,
                    ),
                  ),
                );
              }).toList(),
            ),
          )
        ],
      ),
    );

    return items;
  }

  @override
  Widget build(BuildContext context) {
    GlobalSettingsController globalSettingsController = Get.find();

    return AppVertialListSimpleWidget(
      title: 'Settings',
      items: buildItems(context, globalSettingsController),
    );
  }
}
