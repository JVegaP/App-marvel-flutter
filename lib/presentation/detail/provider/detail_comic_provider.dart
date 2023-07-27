import 'package:flutter/material.dart';
import 'package:marvel_bia_app_flutter/core/constants/app_constants.dart';
import 'package:marvel_bia_app_flutter/core/di/dependency_injection_config.dart';
import 'package:marvel_bia_app_flutter/data/models/base/base_result_model.dart';
import 'package:marvel_bia_app_flutter/data/models/comics/comics_model.dart';
import 'package:marvel_bia_app_flutter/domain/use_cases/get_comic_by_id_use_case.dart';

class DetailComicProvider with ChangeNotifier {
  final GetComicByIdUseCase _getComicByIdUseCase;
  DetailComicProvider({
    GetComicByIdUseCase? getComicByIdUseCase
  }): _getComicByIdUseCase = getComicByIdUseCase ?? getIt<GetComicByIdUseCase>();

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

  ComicsModel _comic = ComicsModel(
      id: kDefaultValueInt,
      title: kDefaultEmptyString,
      description: kDefaultEmptyString,
      isbn: kDefaultEmptyString
  );
  ComicsModel get comic {
    return _comic;
  }
  set comic(ComicsModel comic){
    _comic = comic;
    notifyListeners();
  }

  /// Method that obtain comic by id
  /// param : [id] value of type int of comic
  /// return : Future of type [List<ComicsModel>] with all comics
  Future<ComicsModel?> getComicById({required int id}) async {
    var response = await _getComicByIdUseCase.invoke(id: id);
    if(response is Success) {
      return response.data.results[0];
    }
    if(response is Failure) {
      messageError = response.error.message ?? kDefaultEmptyString;
      return null;
    }
    return null;
  }

}