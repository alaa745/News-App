import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/api/api_manager.dart';
import 'package:newsapp/api/model/sources_response/source.dart';

class NewsFragmentViewModel extends Cubit<NewsFragmentState> {
  NewsFragmentViewModel() : super(LoadingState());
  void loadNewsSources(String categoryId) async {
    var response = await ApiManager.getNewsSources(categoryId);

    try {
      if (response.status == 'error') {
        emit(ErrorState(errorMessage: response.message));
        return;
      }

      if (response.status == 'ok') {
        emit(SuccessState(sources: response.sources!));
      }
    } catch (e) {
      emit(ErrorState(errorMessage: 'Something went wrong! please try again'));
    }
  }
}

abstract class NewsFragmentState {}

class LoadingState extends NewsFragmentState {
  String? loadingMessage;
  LoadingState({this.loadingMessage});
}

class ErrorState extends NewsFragmentState {
  String? errorMessage;
  String? exception;

  ErrorState({this.errorMessage, this.exception});
}

class SuccessState extends NewsFragmentState {
  List<Source> sources;
  SuccessState({required this.sources});
}
