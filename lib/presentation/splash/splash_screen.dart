import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:marvel_bia_app_flutter/core/constants/app_constants.dart';
import 'package:marvel_bia_app_flutter/core/constants/color_constants.dart';
import 'package:marvel_bia_app_flutter/core/constants/strings_constants.dart';
import 'package:marvel_bia_app_flutter/core/constants/style_constants.dart';
import 'package:marvel_bia_app_flutter/core/constants/widget_constants.dart';
import 'package:marvel_bia_app_flutter/core/managers/routes_manager.dart';
import 'package:marvel_bia_app_flutter/core/themes/app_theme.dart';
import 'package:marvel_bia_app_flutter/presentation/widgets/widget_text_label.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    Key? key
  }): super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controllerAnimation;
  @override
  void initState() {
    _controllerAnimation = AnimationController(vsync: this ,duration: const Duration(milliseconds: kDurationMs1500));
    WidgetsBinding.instance.addPostFrameCallback((_) async{
      _setupView(context);
    });
    super.initState();
  }

  @override
  void dispose() {
    _controllerAnimation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      body: _mainContainer(),
    );
  }

  Widget _mainContainer() {
    return Stack(
      children: [
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.asset(
                kAnimationLoading,
                width: kDimens200, height: kDimens200,
                controller: _controllerAnimation,
                fit: BoxFit.contain,
                repeat: true,
                onLoaded: (composition) async {
                  _controllerAnimation.duration = composition.duration;
                },
              ),
              WidgetTextLabel(key: const Key(kWidgetTextLabelSplash),
                text: kNameApp,
                textAlign: TextAlign.center,
                textStyle: AppTheme.getAppTheme().textTheme.bodyLarge?.copyWith(
                    color: kBlackSecondary
                )
              ),
            ],
          ),
        )
      ],
    );
  }

  /// Method that setup view initial
  void _setupView(BuildContext context) async {
    _controllerAnimation.value = kDefaultValueDouble;
    _controllerAnimation.duration = const Duration(milliseconds: kDurationMs1500);
    _controllerAnimation.repeat();
    await Future.delayed( const Duration(milliseconds: kDurationMs3500),(){
      _navigateToHome();
    });
  }

  /// Method that navigate to home
  void _navigateToHome() {
    routes.openHomeScreen(context);
  }
}