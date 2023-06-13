import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:newsapp/screens/articles/articles_arguments.dart';
import 'package:newsapp/shared/style/components/article_item.dart';
import 'package:newsapp/shared/style/components/tab_item.dart';

class ArticlesScreen extends StatefulWidget {
  static const String routeName = "Articels";
  @override
  State<ArticlesScreen> createState() => _ArticlesScreenState();
}

class _ArticlesScreenState extends State<ArticlesScreen> {
  int selectedIndex = 0;

  List<String> sources = [
    "BBC News",
    "ABC News",
    "CBC News",
    "CNN News",
    "BEIN News",
    "SKY News",
    "ON News",
  ];

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as ArticlesArguments;

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/background.jpg"),
        ),
      ),
      child: Scaffold(
        drawer: Drawer(),
        appBar: AppBar(
          title: Text(
            args.categoryTitle,
          ),
        ),
        body: DefaultTabController(
          length: sources.length,
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TabBar(
                  isScrollable: true,
                  indicatorColor: Colors.transparent,
                  onTap: (index) {
                    selectedIndex = index;
                    setState(() {});
                  },
                  tabs: sources
                      .map(
                        (source) => TabItem(
                            selceted: selectedIndex == sources.indexOf(source),
                            sourceTitle: source),
                      )
                      .toList(),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return ArticleItem();
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
