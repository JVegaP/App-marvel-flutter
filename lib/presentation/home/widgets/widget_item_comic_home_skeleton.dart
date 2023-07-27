import 'package:flutter/material.dart';
import 'package:marvel_bia_app_flutter/core/constants/color_constants.dart';
import 'package:marvel_bia_app_flutter/core/constants/style_constants.dart';
import 'package:shimmer/shimmer.dart';

class WidgetItemComicHomeSkeleton extends StatelessWidget {
  const WidgetItemComicHomeSkeleton({ Key? key}): super(key: key);

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
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(kDimens15)),
              color: kGrayLight
          ),
          width: MediaQuery.of(context).size.width,
          child: Shimmer.fromColors(
            baseColor: kGrayLightSecondary,
            highlightColor: kGrayLight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: kDimens10, horizontal: kDimens15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: kDimens100,
                        height: kDimens100,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(kDimens5)),
                            color: kGrayLightSecondary
                        ),
                      ),
                      const SizedBox(width: kDimens10),
                      Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              _createLabel(width: (MediaQuery.of(context).size.width / kDimens2) - kDimens40, height: kDimens10),
                              const SizedBox(height: kDimens10),
                              _createLabel(width: (MediaQuery.of(context).size.width / kDimens2) - kDimens40, height: kDimens10),
                            ],
                          )
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: kDimens20)
      ],
    );
  }
}