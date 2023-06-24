import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/api/api_manager.dart';
import 'package:newsapp/api/model/news_response/article.dart';

class NewsListViewModel extends Cubit<NewsListState> {
  NewsListViewModel() : super(LoadingState());

  void loadNews(String source) async {
    var response = await ApiManager.getNews(source);

    try {
      if (response.status == 'error') {
        emit(ErrorState(errorMessage: response.message));
        return;
      }

      if (response.status == 'ok') {
        emit(SuccessState(news: response.articles!));
      }
    } catch (e) {
      emit(ErrorState(errorMessage: 'Something went wrong! please try again'));
    }
  }
}

abstract class NewsListState {}

class LoadingState extends NewsListState {
  String? loadingMessage;
  LoadingState({this.loadingMessage});
}

class ErrorState extends NewsListState {
  String? errorMessage;
  String? exception;

  ErrorState({this.errorMessage, this.exception});
}

class SuccessState extends NewsListState {
  List<Article> news;
  SuccessState({required this.news});
}
