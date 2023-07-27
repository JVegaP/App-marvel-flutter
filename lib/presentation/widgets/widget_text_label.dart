import 'package:flutter/material.dart';
import 'package:marvel_bia_app_flutter/core/themes/app_theme.dart';

/// Class that create a text label widget customizable
class WidgetTextLabel extends StatelessWidget {

  final String text;
  final TextAlign textAlign;
  final TextStyle? textStyle;
  final int? maxLines;

  const WidgetTextLabel({
    required Key key,
    required this.text,
    this.textAlign = TextAlign.start,
    this.textStyle,
    this.maxLines
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      key: key,
      text,
      style: textStyle ?? AppTheme.getAppTheme().textTheme.bodyMedium,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
    );
  }
}