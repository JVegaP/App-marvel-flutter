import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:marvel_bia_app_flutter/core/constants/app_constants.dart';
import 'package:marvel_bia_app_flutter/core/constants/color_constants.dart';
import 'package:marvel_bia_app_flutter/core/constants/strings_constants.dart';
import 'package:marvel_bia_app_flutter/core/constants/style_constants.dart';
import 'package:marvel_bia_app_flutter/core/constants/widget_constants.dart';
import 'package:marvel_bia_app_flutter/core/di/dependency_injection_config.dart';
import 'package:marvel_bia_app_flutter/core/managers/routes_manager.dart';
import 'package:marvel_bia_app_flutter/core/themes/app_theme.dart';
import 'package:marvel_bia_app_flutter/presentation/home/provider/home_provider.dart';
import 'package:marvel_bia_app_flutter/presentation/home/widgets/widget_item_comic_home.dart';
import 'package:marvel_bia_app_flutter/presentation/home/widgets/widget_item_comic_home_skeleton.dart';
import 'package:marvel_bia_app_flutter/presentation/widgets/widget_header_bar.dart';
import 'package:marvel_bia_app_flutter/presentation/widgets/widget_text_label.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key
  }): super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controllerAnimation;
  final TextEditingController _controllerSearch = TextEditingController();
  HomeProvider state = getIt<HomeProvider>();

  @override
  void initState() {
    state = Provider.of<HomeProvider>(context, listen: false);
    _controllerAnimation = AnimationController(vsync: this ,duration: const Duration(milliseconds: kDurationMs1500));
    WidgetsBinding.instance.addPostFrameCallback((_) async{
      _setupView();
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
    state = Provider.of<HomeProvider>(context, listen: true);
    return Scaffold(
      backgroundColor: kWhite,
      body: SafeArea(
        child: _mainContainer()
      )
    );
  }

  ///-------------------------------- PRIVATE METHODS ---------------------------------
  Widget _mainContainer() {
    return Stack(
      children: [
        WidgetHeaderBar(
          key: const Key(kWidgetHeader),
          text: kTitleHome,
          suffixIcon: IconButton(
            onPressed: () {
              state.isSearch = !state.isSearch;
              if(!state.isSearch) {
                _controllerSearch.text = kDefaultEmptyString;
                _setupView();
              }
            },
            icon: Icon(
              state.isSearch ? Icons.cancel : Icons.search,
              color: kGreen,
              size: kDimens25,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: state.isSearch ? kDimens120 : kDimens80),
          child: state.isShowViewEmpty() ? _viewEmpty() : ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(kDimens20),
              itemCount: state.isLoading ? kDimens10.toInt() : state.comics.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                if(state.isLoading) {
                  return const WidgetItemComicHomeSkeleton();
                } else {
                  return WidgetItemComicHome(
                    key: const Key(kWidgetItemHome),
                    item: state.comics.elementAt(index),
                    onClick: () {
                      routes.openDetailScreen(context: context, id: state.comics.elementAt(index).id);
                    },
                  );
                }
              }
          ),
        ),
        _textSearch(),
      ],
    );
  }

  /// Method that draw widget text search custom
  Widget _textSearch() {
    return Visibility(
      visible: state.isSearch,
      child: Padding(
        padding: const EdgeInsets.only(top: kDimens80),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: kDimens20, vertical: kDimens10),
          child: TextField(
            controller: _controllerSearch,
            keyboardType: TextInputType.text,
            style: AppTheme.getAppTheme().textTheme.bodyMedium?.copyWith(
                color: kBlack
            ),
            onSubmitted: (String value) {
              if(value.isNotEmpty) {
                _filterByTitle(title: value);
              }
            },
            onChanged: (String value) {
              if(value.isEmpty) {
                _setupView();
              }
            },
            decoration: InputDecoration(
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: kGrayLightSecondary),
                  borderRadius: BorderRadius.all(Radius.circular(kDimens15))
              ),
              border: const OutlineInputBorder(
                  borderSide: BorderSide(color: kGrayLightSecondary),
                  borderRadius: BorderRadius.all(Radius.circular(kDimens15))
              ),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: kGrayLightSecondary),
                  borderRadius: BorderRadius.all(Radius.circular(kDimens15))
              ),
              contentPadding: const EdgeInsetsDirectional.all(kDimens10),
              fillColor: kWhite,
              filled: true,
              hintText: kSearchByTitle,
              hintStyle: AppTheme.getAppTheme().textTheme.bodyMedium?.copyWith(
                  color: kBlack.withOpacity(.5)
              ),
            ),
            textAlign: TextAlign.start,
            textCapitalization: TextCapitalization.words,
            textInputAction: TextInputAction.search,
          ),
        ),
      ),
    );
  }

  /// Method that draw widget for view empty
  Widget _viewEmpty() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset(
            kAnimationEmpty,
            width: kDimens200, height: kDimens200,
            controller: _controllerAnimation,
            fit: BoxFit.contain,
            repeat: true,
            onLoaded: (composition) async {
              _controllerAnimation.duration = composition.duration;
            },
          ),
          WidgetTextLabel(key: const Key(kWidgetTextLabelViewEmpty),
            text: kSearchEmpty,
            textAlign: TextAlign.center,
            textStyle: AppTheme.getAppTheme().textTheme.bodyMedium?.copyWith(
                color: kBlackSecondary
            ),
            maxLines: 4,
          ),
          const SizedBox(height: kDimens60)
        ],
      ),
    );
  }

  /// Method that setup view initial
  void _setupView() async {
    state.isLoading = true;
    await state.getComics().then((value) => {
      state.comics = value,
      if(value.isEmpty) _initAnimation()
    }).whenComplete(() {
      state.isLoading = false;
    });
  }

  /// Method that search comics filter by title
  void _filterByTitle({required String title}) async {
    state.isLoading = true;
    await state.getComics(title: title).then((value) => {
      state.comics = value,
      if(value.isEmpty) _initAnimation()
    }).whenComplete(() {
      state.isLoading = false;
    });
  }

  /// Method that initialize animation
  void _initAnimation() {
    _controllerAnimation.value = kDefaultValueDouble;
    _controllerAnimation.duration = const Duration(milliseconds: kDurationMs1500);
    _controllerAnimation.repeat();
  }
}