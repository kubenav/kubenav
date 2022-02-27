import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:kubenav/pages/resources_list_crds/resources_list_crds_controller.dart';
import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';
import 'package:kubenav/widgets/app_bottom_navigation_bar_widget.dart';
import 'package:kubenav/widgets/app_error_widget.dart';

class ResourcesListCRDs extends GetView<ResourcesListCRDsController> {
  const ResourcesListCRDs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Column(
        children: [
          Text(
            Characters('CustomResourceDefinitions')
                .replaceAll(Characters(''), Characters('\u{200B}'))
                .toString(),
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Text(
            Characters('All Namespaces')
                .replaceAll(Characters(''), Characters('\u{200B}'))
                .toString(),
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      )),
      bottomNavigationBar: const AppBottomNavigationBarWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Obx(
              () {
                if (controller.loading.value) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(Constants.spacingMiddle),
                        child: CircularProgressIndicator(
                            color: Constants.colorPrimary),
                      ),
                    ],
                  );
                }

                if (controller.error.value != '') {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Padding(
                          padding:
                              const EdgeInsets.all(Constants.spacingMiddle),
                          child: AppErrorWidget(error: controller.error.value),
                        ),
                      ),
                    ],
                  );
                }

                return Wrap(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(
                        top: Constants.spacingMiddle,
                        bottom: Constants.spacingMiddle,
                      ),
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.only(
                          right: Constants.spacingMiddle,
                          left: Constants.spacingMiddle,
                        ),
                        itemCount: controller.items.length,
                        itemBuilder: (context, index) {
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
                                  spreadRadius:
                                      Constants.sizeBorderSpreadRadius,
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
                                    '/resources/list?title=${controller.items[index].title}&resource=${controller.items[index].resource}&path=${controller.items[index].path}&scope=${controller.items[index].scope.name}');
                              },
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          Characters(
                                                  controller.items[index].title)
                                              .replaceAll(Characters(''),
                                                  Characters('\u{200B}'))
                                              .toString(),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: primaryTextStyle(),
                                        ),
                                        Text(
                                          Characters(controller
                                                  .items[index].description)
                                              .replaceAll(Characters(''),
                                                  Characters('\u{200B}'))
                                              .toString(),
                                          overflow: TextOverflow.fade,
                                          softWrap: false,
                                          style: secondaryTextStyle(),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
