import 'package:flutter/material.dart';
import 'package:marvel_bia_app_flutter/core/constants/app_constants.dart';
import 'package:marvel_bia_app_flutter/core/di/dependency_injection_config.dart';
import 'package:marvel_bia_app_flutter/data/models/base/base_result_model.dart';
import 'package:marvel_bia_app_flutter/data/models/comics/comics_model.dart';
import 'package:marvel_bia_app_flutter/domain/use_cases/get_all_comics_use_case.dart';

class HomeProvider with ChangeNotifier {
  final GetAllComicsUseCase _getAllComicsUseCase;

  HomeProvider({
    GetAllComicsUseCase? getAllComicsUseCase
  }): _getAllComicsUseCase = getAllComicsUseCase ?? getIt<GetAllComicsUseCase>();

  bool _isLoading = false;
  bool get isLoading {
    return _isLoading;
  }
  set isLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  String _messageError = kDefaultEmptyString;
  String get messageError {
    return _messageError;
  }
  set messageError(String messageError) {
    _messageError = messageError;
    notifyListeners();
  }

  bool _isSearch = false;
  bool get isSearch {
    return _isSearch;
  }
  set isSearch(bool isSearch) {
    _isSearch = isSearch;
    notifyListeners();
  }

  List<ComicsModel> _comics = <ComicsModel>[];
  List<ComicsModel> get comics {
    return _comics;
  }
  set comics(List<ComicsModel> comics){
    _comics = comics;
    notifyListeners();
  }

  /// Method that validate if view empty is show
  /// return : Value bool if view empty is visible
  bool isShowViewEmpty() {
    return comics.isEmpty && !isLoading;
  }

  /// Method that list all comics
  /// return : Future of type [List<ComicsModel>] with all comics
  Future<List<ComicsModel>> getComics({String? title}) async {
    var response = await _getAllComicsUseCase.invoke(title: title);
    if(response is Success) {
      return response.data.results;
    }
    if(response is Failure) {
      messageError = response.error.message ?? kDefaultEmptyString;
      return [];
    }
    return [];
  }
}