import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/api/api_manager.dart';
import 'package:newsapp/screens/articles/articles_screen.dart';
import 'package:newsapp/screens/articles/news_list_viewmodel.dart';
import 'package:newsapp/shared/style/components/news_item.dart';

import '../../../api/model/sources_response/source.dart';

class NewsList extends StatelessWidget {
  Source source;
  NewsList(this.source);

  NewsListViewModel newsListViewModel = NewsListViewModel();

  @override
  Widget build(BuildContext context) {
    newsListViewModel.loadNews(source.id!);
    return BlocBuilder<NewsListViewModel, NewsListState>(
      bloc: newsListViewModel,
      builder: (context, state) {
        if (state is ErrorState) {
          return Center(
            child: Column(
              children: [
                Text(state.errorMessage!),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Try again'),
                )
              ],
            ),
          );
        } else if (state is LoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is SuccessState) {
          var newsList = state.news;
          return ListView.builder(
            itemCount: newsList.length,
            itemBuilder: (_, index) {
              return NewsItem(article: newsList[index]);
            },
          );
        }
        return Container();
      },
    );
    // return FutureBuilder(
    //   future: ApiManager.getNews(source.id!),
    //   builder: (context, snaphot) {
    //     if (snaphot.connectionState == ConnectionState.waiting) {
    // return const Center(
    //   child: CircularProgressIndicator(),
    // );
    //     }
    //     if (snaphot.hasError) {
    //       return Center(
    //         child: Column(
    //           children: [
    //             Text(snaphot.error.toString()),
    //             ElevatedButton(
    //               onPressed: () {},
    //               child: const Text('Try again'),
    //             )
    //           ],
    //         ),
    //       );
    //     }
    //     var response = snaphot.data;
    //     if (response?.status == 'error') {
    //       return Center(
    //         child: Column(
    //           children: [
    //             Text('Server Error${response?.message}'),
    //             ElevatedButton(
    //               onPressed: () {},
    //               child: const Text('Try again'),
    //             )
    //           ],
    //         ),
    //       );
    //     }
    //     var newsList = response?.articles;
    //     return ListView.builder(
    //       itemCount: newsList?.length ?? 0,
    //       itemBuilder: (_, index) {
    //         return NewsItem(article: newsList![index]);
    //       },
    //     );
    //   },
    // );
  }
}
