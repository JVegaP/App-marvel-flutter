import 'package:flutter/material.dart';
import 'package:marvel_bia_app_flutter/core/constants/app_constants.dart';
import 'package:marvel_bia_app_flutter/core/constants/color_constants.dart';
import 'package:marvel_bia_app_flutter/core/constants/strings_constants.dart';
import 'package:marvel_bia_app_flutter/core/constants/style_constants.dart';
import 'package:marvel_bia_app_flutter/core/constants/widget_constants.dart';
import 'package:marvel_bia_app_flutter/core/di/dependency_injection_config.dart';
import 'package:marvel_bia_app_flutter/core/themes/app_theme.dart';
import 'package:marvel_bia_app_flutter/presentation/detail/provider/detail_comic_provider.dart';
import 'package:marvel_bia_app_flutter/presentation/detail/widgets/widget_detail_comic_skeleton.dart';
import 'package:marvel_bia_app_flutter/presentation/widgets/widget_header_bar.dart';
import 'package:marvel_bia_app_flutter/presentation/widgets/widget_text_label.dart';
import 'package:provider/provider.dart';

class DetailComicScreen extends StatefulWidget {
  final int _id;
  const DetailComicScreen({
    Key? key,
    required int id
  }): _id = id,
        super(key: key);

  @override
  DetailComicScreenState createState() => DetailComicScreenState();
}

class DetailComicScreenState extends State<DetailComicScreen> {
  DetailComicProvider state = getIt<DetailComicProvider>();

  @override
  void initState() {
    state = Provider.of<DetailComicProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) async{
      _setupView();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    state = Provider.of<DetailComicProvider>(context, listen: true);
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
            text: state.isLoading ? kDefaultEmptyString : state.comic.title,
            prefixIcon: IconButton(
              onPressed: () {Navigator.pop(context);},
              icon: const Icon(
                Icons.arrow_back,
                color: kGreen,
                size: kDimens25,
              ),
            ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: kDimens80, left: kDimens20, right: kDimens20),
          child: state.isLoading ? const WidgetDetailComicSkeleton():
          Align(
            alignment: Alignment.topCenter,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: kDimens20),
                  Container(
                      height: kDimens200,
                      width: kDimens200,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(kDimens15)),
                          color: kGrayLight,
                          image: DecorationImage(
                            image: NetworkImage(_urlImage()),
                            fit: BoxFit.fill,
                          )
                      )
                  ),
                  const SizedBox(height: kDimens20),
                  WidgetTextLabel(key: const Key(kWidgetTextLabelTitleItemComic),
                    text: state.comic.title,
                    textAlign: TextAlign.center,
                    maxLines: 5,
                    textStyle: AppTheme.getAppTheme().textTheme.bodyLarge?.copyWith(
                        color: kBlackSecondary
                    ),
                  ),
                  const SizedBox(height: kDimens5),
                  Visibility(
                    visible: state.comic.isbn.isNotEmpty,
                    child: WidgetTextLabel(key: const Key(kWidgetTextLabelIsbnItemComic),
                      text: '$kIsbn${state.comic.isbn}',
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      textStyle: AppTheme.getAppTheme().textTheme.bodySmall?.copyWith(
                        color: kGreen,
                        fontSize: kDimens15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: kDimens15),
                  WidgetTextLabel(key: const Key(kWidgetTextLabelDescriptionItemComic),
                    text: state.comic.description,
                    textAlign: TextAlign.center,
                    maxLines: 20,
                    textStyle: AppTheme.getAppTheme().textTheme.bodyMedium?.copyWith(
                        color: kBlackSecondary.withOpacity(.5)
                    ),
                  ),
                ],
              ),
            ),
          )
        )
      ],
    );
  }

  /// Method that create path of image
  /// return : Value String with the url path of image
  String _urlImage() {
    var path = state.comic.thumbnail?.path.replaceAll("http", "https") ?? kDefaultEmptyString;
    var extension = state.comic.thumbnail?.extension;
    return '$path.$extension';
  }

  /// Method that setup view initial
  void _setupView() async {
    state.isLoading = true;
    await state.getComicById(id: widget._id).then((value) => {
      if(value != null) state.comic = value
    }).whenComplete(() {
      state.isLoading = false;
    });
  }

}
