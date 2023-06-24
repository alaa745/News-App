import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/api/api_manager.dart';
import 'package:newsapp/screens/articles/articles_screen.dart';
import 'package:newsapp/screens/home_news_fragment/news_fragment_viewmodel.dart';

import '../articles/articles_arguments.dart';

class HomeNewsFragment extends StatelessWidget {
  static const String routeName = "News";

  HomeNewsFragment({super.key});

  var viewModel = NewsFragmentViewModel();
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as ArticlesArguments;

    viewModel.loadNewsSources(args.categoryTitle.toLowerCase());

    return BlocBuilder<NewsFragmentViewModel, NewsFragmentState>(
      bloc: viewModel,
      builder: (context, state) {
        if (state is LoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ErrorState) {
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
        } else if (state is SuccessState) {
          return ArticlesScreen(
            sources: state.sources,
            categoryTitle: args.categoryTitle,
          );
        }
        return Container();
      },
    );
  }
}
