import 'package:flutter/material.dart';
import 'package:marvel_bia_app_flutter/core/constants/color_constants.dart';
import 'package:marvel_bia_app_flutter/core/constants/style_constants.dart';
import 'package:shimmer/shimmer.dart';

class WidgetDetailComicSkeleton extends StatelessWidget {
  const WidgetDetailComicSkeleton({ Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return _createMainContainer(context);
  }

  ///--------------------------------- PRIVATE METHODS ---------------------------------

  /// Create the skeleton of label
  Widget _createLabel({
    required double width,
    required double height})
  {
    return Container(
      width: width,
      height: height,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(kDimens15)),
          color: kGrayLightSecondary
      ),
    );
  }

  /// Create the skeleton main container
  Widget _createMainContainer(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.transparent
      ),
      width: MediaQuery.of(context).size.width,
      child: Shimmer.fromColors(
        baseColor: kGrayLightSecondary,
        highlightColor: kGrayLight,
        child: Padding(
          padding: const EdgeInsets.all(kDimens20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: kDimens200,
                height: kDimens200,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(kDimens5)),
                    color: kGrayLightSecondary
                ),
              ),
              const SizedBox(height: kDimens20),
              _createLabel(width: (MediaQuery.of(context).size.width / kDimens2) - kDimens40, height: kDimens10),
              const SizedBox(height: kDimens20),
              _createLabel(width: (MediaQuery.of(context).size.width / kDimens2) - kDimens40, height: kDimens10),
              const SizedBox(height: kDimens20),
              _createLabel(width: (MediaQuery.of(context).size.width) - kDimens100, height: kDimens10),
            ],
          ),
        ),
      ),
    );
  }
}