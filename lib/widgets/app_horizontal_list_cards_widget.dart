import 'package:flutter/material.dart';

import 'package:kubenav/utils/constants.dart';
import 'package:kubenav/utils/helpers.dart';

/// [AppHorizontalListCardsModel] is the model, which is used to create a card in the horizontal list. The [subtitle] of
/// a card is of the type `List<String>`, where each item in the list represents one line of the subtitle. This allows
/// us to render a multiline subtitle with control of the overflow for each line.
class AppHorizontalListCardsModel {
  String title;
  List<String> subtitle;
  String image;
  BoxFit imageFit;
  void Function() onTap;

  AppHorizontalListCardsModel({
    required this.title,
    required this.subtitle,
    required this.image,
    this.imageFit = BoxFit.fill,
    required this.onTap,
  });
}

/// [AppHorizontalListCardsWidget] is a horizontal list widget, where the items in the list are rendered as [cards] with
/// a title, subtitle, image and onTap function. To create the list the user must also provide an [title] for the list
/// and some optional more arguments. When the more prefixed arguments are provided the [moreText] and [moreIcon] will
/// be displayed next to the title. The widget can be used as follows:
///
/// ```
/// AppHorizontalListCardsWidget(
///   title: 'Add Cluster',
///   cards: List.generate(
///     controller.providers.length,
///     (index) => AppHorizontalListCardsModel(
///       title: controller.providers[index].title,
///       subtitle: controller.providers[index].subtitle,
///       image: controller.providers[index].image,
///       onTap: () {
///         controller.showAddClusterBottomSheet(index);
///       },
///     ),
///   ),
/// ),
///  ```
class AppHorizontalListCardsWidget extends StatelessWidget {
  const AppHorizontalListCardsWidget({
    Key? key,
    required this.title,
    required this.cards,
    this.moreText,
    this.moreIcon,
    this.moreOnTap,
  }) : super(key: key);

  final String title;
  final List<AppHorizontalListCardsModel> cards;
  final String? moreText;
  final IconData? moreIcon;
  final void Function()? moreOnTap;

  /// [buildMore] creates the more widget with the provided text, icon and onTap function. If the user doesn't provided
  /// these arguments, the function returns an empty container widget.
  Widget buildMore(
      String? moreText, IconData? moreIcon, void Function()? moreOnTap) {
    if (moreText != null && moreIcon != null) {
      return InkWell(
        onTap: moreOnTap,
        child: Wrap(
          children: [
            Text(
              moreText,
              style: secondaryTextStyle(color: Constants.colorPrimary),
            ),
            const SizedBox(width: Constants.spacingExtraSmall),
            Icon(
              moreIcon,
              color: Constants.colorPrimary,
              size: 16,
            ),
          ],
        ),
      );
    }

    return Container();
  }

  /// [buildSubtitle] creates the subtitle widget. Eachitem in the list of [subtitle] represents one line of text in the
  /// returned column widget.
  Widget buildSubtitle(List<String> subtitle) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: subtitle
          .map((e) => Text(
                Characters(e)
                    .replaceAll(Characters(''), Characters('\u{200B}'))
                    .toString(),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: secondaryTextStyle(),
              ))
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: Constants.spacingMiddle,
            left: Constants.spacingMiddle,
            right: Constants.spacingMiddle,
            bottom: Constants.spacingSmall,
          ),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Text(title, style: primaryTextStyle(size: 18)),
              ),
              buildMore(moreText, moreIcon, moreOnTap),
            ],
          ),
        ),
        SingleChildScrollView(
          padding: const EdgeInsets.only(
            right: Constants.spacingMiddle,
            left: Constants.spacingSmall,
          ),
          scrollDirection: Axis.horizontal,
          child: Wrap(
            spacing: Constants.spacingSmall,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            direction: Axis.horizontal,
            runAlignment: WrapAlignment.spaceBetween,
            crossAxisAlignment: WrapCrossAlignment.start,
            runSpacing: Constants.spacingSmall,
            children: List.generate(
              cards.length,
              (index) => Container(
                width: 250,
                margin: const EdgeInsets.only(
                  top: Constants.spacingSmall,
                  bottom: Constants.spacingSmall,
                  left: Constants.spacingSmall,
                ),
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
                  onTap: cards[index].onTap,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Constants.colorPrimary,
                          borderRadius: BorderRadius.only(
                            topLeft:
                                Radius.circular(Constants.sizeBorderRadius),
                            topRight:
                                Radius.circular(Constants.sizeBorderRadius),
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft:
                                Radius.circular(Constants.sizeBorderRadius),
                            topRight:
                                Radius.circular(Constants.sizeBorderRadius),
                          ),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Image.asset(
                            cards[index].image,
                            height: 140,
                            width: 250,
                            fit: cards[index].imageFit,
                          ),
                        ),
                      ),
                      const SizedBox(height: Constants.spacingSmall),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: Constants.spacingSmall,
                        ),
                        child: Text(
                          Characters(cards[index].title)
                              .replaceAll(
                                  Characters(''), Characters('\u{200B}'))
                              .toString(),
                          overflow: TextOverflow.ellipsis,
                          style: primaryTextStyle(),
                        ),
                      ),
                      const SizedBox(height: Constants.spacingExtraSmall),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: Constants.spacingSmall,
                        ),
                        child: buildSubtitle(cards[index].subtitle),
                      ),
                      const SizedBox(height: Constants.spacingSmall),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
