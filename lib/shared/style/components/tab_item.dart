import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:newsapp/api/model/sources_response/source.dart';

class TabItem extends StatelessWidget {
  bool selceted;
  Source? source;

  TabItem({required this.selceted, required this.source});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: selceted ? Theme.of(context).primaryColor : Colors.transparent,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Theme.of(context).primaryColor, width: 2),
      ),
      child: Text(
        source?.name ?? "",
        style: TextStyle(
            fontSize: 15,
            color: selceted ? Colors.white : Theme.of(context).primaryColor),
      ),
    );
  }
}
