import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:kubenav/models/resource_model.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';

enum Status {
  undefined,
  success,
  warning,
  danger,
}

abstract class IListItemWidget {
  const IListItemWidget({
    required this.title,
    required this.resource,
    required this.path,
    required this.scope,
    required this.item,
  });

  final String? title;
  final String? resource;
  final String? path;
  final ResourceScope? scope;
  final dynamic item;
}

class ListItemWidget extends StatelessWidget {
  const ListItemWidget({
    Key? key,
    required this.title,
    required this.resource,
    required this.path,
    required this.scope,
    required this.name,
    required this.namespace,
    required this.info,
    this.status = Status.undefined,
    this.onTap,
  }) : super(key: key);

  final String? title;
  final String? resource;
  final String? path;
  final ResourceScope? scope;
  final String name;
  final String? namespace;
  final String info;
  final Status status;
  final void Function()? onTap;

  Widget buildStatus(BuildContext context) {
    if (status != Status.undefined) {
      return Wrap(
        children: [
          const SizedBox(width: Constants.spacingSmall),
          Icon(
            Icons.radio_button_checked,
            size: 24,
            color: status == Status.success
                ? Constants.colorSuccess
                : status == Status.danger
                    ? Constants.colorDanger
                    : Constants.colorWarning,
          ),
        ],
      );
    }

    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: Constants.spacingMiddle,
      ),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Constants.shadowColorGlobal,
            blurRadius: Constants.sizeBorderBlurRadius,
            spreadRadius: Constants.sizeBorderSpreadRadius,
            offset: const Offset(0.0, 0.0),
          ),
        ],
        color: Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(Constants.sizeBorderRadius),
        ),
      ),
      child: InkWell(
        onTap: () {
          Get.toNamed(
            '/resources/details?title=$title&resource=$resource&path=$path&scope=${scope?.name}&name=$name&${namespace != null ? 'namespace=$namespace' : ''}',
          );
        },
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Characters(name)
                        .replaceAll(Characters(''), Characters('\u{200B}'))
                        .toString(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: primaryTextStyle(),
                  ),
                  Text(
                    Characters(info)
                        .replaceAll(Characters(''), Characters('\u{200B}'))
                        .toString(),
                    overflow: TextOverflow.fade,
                    softWrap: false,
                    style: secondaryTextStyle(),
                  ),
                ],
              ),
            ),
            buildStatus(context),
          ],
        ),
      ),
    );
  }
}
