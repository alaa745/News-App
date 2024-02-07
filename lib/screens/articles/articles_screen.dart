import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:newsapp/api/model/sources_response/source.dart';
import 'package:newsapp/screens/articles/articles_arguments.dart';
import 'package:newsapp/shared/style/components/news_list.dart';
import 'package:newsapp/shared/style/components/tab_item.dart';

class ArticlesScreen extends StatefulWidget {
  static const String routeName = "Articels";
  List<Source>? sources;
  String categoryTitle;

  ArticlesScreen({required this.sources, required this.categoryTitle});
  @override
  State<ArticlesScreen> createState() => _ArticlesScreenState();
}

class _ArticlesScreenState extends State<ArticlesScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    // final args =
    // ModalRoute.of(context)!.settings.arguments as ArticlesArguments;

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("images/background.jpg"), fit: BoxFit.cover),
      ),
      child: Scaffold(
        drawer: Drawer(),
        appBar: AppBar(
          title: Text(
            widget.categoryTitle,
          ),
        ),
        body: DefaultTabController(
          length: widget.sources!.length,
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TabBar(
                  isScrollable: true,
                  indicatorColor: Colors.transparent,
                  onTap: (index) {
                    selectedIndex = index;
                    setState(() {});
                  },
                  tabs: widget.sources
                          ?.map(
                            (source) => TabItem(
                                selceted: selectedIndex ==
                                    widget.sources?.indexOf(source),
                                source: source),
                          )
                          .toList() ??
                      [],
                ),
                Expanded(
                  child: NewsList(widget.sources![selectedIndex]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
