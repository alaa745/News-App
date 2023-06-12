import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ArticleItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Container(
        margin: EdgeInsets.only(top: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 200,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/NewsTest.png"),
                    fit: BoxFit.cover),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "BBC NEWS",
              style: TextStyle(
                fontSize: 10,
                color: Color(0xFF79828B),
              ),
            ),
            const Text(
              "Why are football's biggest clubs starting a new \ntournament?",
              style: TextStyle(
                fontSize: 15,
                color: Color(0xFF42505C),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Text(
                  "3 hours ago",
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xFF79828B),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
