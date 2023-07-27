import 'package:flutter/material.dart';
import 'package:marvel_bia_app_flutter/core/constants/app_constants.dart';
import 'package:marvel_bia_app_flutter/core/constants/color_constants.dart';
import 'package:marvel_bia_app_flutter/core/constants/style_constants.dart';
import 'package:marvel_bia_app_flutter/core/constants/widget_constants.dart';
import 'package:marvel_bia_app_flutter/core/themes/app_theme.dart';
import 'package:marvel_bia_app_flutter/data/models/comics/comics_model.dart';
import 'package:marvel_bia_app_flutter/presentation/widgets/widget_text_label.dart';

/// Class that create a item customizable for the comics
class WidgetItemComicHome extends StatefulWidget {
  final ComicsModel _item;
  final Function() _onClick;
  const WidgetItemComicHome({
    required Key key,
    required ComicsModel item,
    required Function() onClick,
  }): _item = item,
        _onClick = onClick,
        super(key: key);

  @override
  State<StatefulWidget> createState() => _WidgetItemComicHome();

}

class _WidgetItemComicHome extends State<WidgetItemComicHome> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: (){
            widget._onClick();
          },
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(kDimens15)),
              boxShadow: [
                BoxShadow(
                    blurRadius: kDimens10,
                    color: kGrayLight,
                    offset: Offset(kDimens2, kDimens5)
                )
              ],
              color: kWhite,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: kDimens10, horizontal: kDimens15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      height: kDimens100,
                      width: kDimens100,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(kDimens15)),
                          color: kGrayLight,
                          image: DecorationImage(
                            image: NetworkImage(urlImage()),
                            fit: BoxFit.fill,
                          )
                      )
                  ),
                  const SizedBox(width: kDimens10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        WidgetTextLabel(key: const Key(kWidgetTextLabelTitleItemComic),
                          text: widget._item.title,
                          textAlign: TextAlign.start,
                          maxLines: 2,
                        ),
                        const SizedBox(height: kDimens5),
                        WidgetTextLabel(key: const Key(kWidgetTextLabelDescriptionItemComic),
                          text: widget._item.description,
                          textAlign: TextAlign.start,
                          textStyle: AppTheme.getAppTheme().textTheme.bodySmall?.copyWith(
                              color: kBlackSecondary
                          ),
                          maxLines: 4,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),

        ),
        const SizedBox(height: kDimens20)
      ],
    );
  }

  /// Method that change path of image
  String urlImage() {
    var path = widget._item.thumbnail?.path.replaceAll("http", "https") ?? kDefaultEmptyString;
    var extension = widget._item.thumbnail?.extension;
    return '$path.$extension';
  }
}