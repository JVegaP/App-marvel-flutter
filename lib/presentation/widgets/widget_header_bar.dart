import 'package:flutter/material.dart';
import 'package:marvel_bia_app_flutter/core/constants/color_constants.dart';
import 'package:marvel_bia_app_flutter/core/constants/style_constants.dart';
import 'package:marvel_bia_app_flutter/core/constants/widget_constants.dart';
import 'package:marvel_bia_app_flutter/core/themes/app_theme.dart';
import 'package:marvel_bia_app_flutter/presentation/widgets/widget_text_label.dart';

/// Class that create a header bar widget customizable
class WidgetHeaderBar extends StatelessWidget {

  final Color? colorBackground;
  final String text;
  final TextStyle? textStyle;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  const WidgetHeaderBar({
    required Key key,
    this.colorBackground,
    required this.text,
    this.textStyle,
    this.prefixIcon,
    this.suffixIcon
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              color: colorBackground ?? kBlue,
              boxShadow: const [
                BoxShadow(
                    blurRadius: kDimens20,
                    color: kShadowLightHeader,
                    offset: Offset(kDimens0, kDimens5)
                )
              ]
          ),
          height: kDimens80,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                    padding: const EdgeInsets.only(left: kDimens10),
                    child: prefixIcon
                ),
              ),
              Center(
                child:  Padding(
                  padding: const EdgeInsets.only(left: kDimens60, right: kDimens60),
                  child: WidgetTextLabel(
                    key: const Key(kWidgetTextLabelTitleHeader),
                    maxLines: 2,
                    text: text,
                    textAlign: TextAlign.center,
                    textStyle: textStyle ?? AppTheme.getAppTheme().textTheme.bodyMedium?.copyWith(
                        color: kWhite,
                        fontSize: kDimens20
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                    padding: const EdgeInsets.only(right: kDimens10),
                    child: suffixIcon
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}