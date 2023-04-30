import 'package:flutter/material.dart';

class Questions extends StatelessWidget {
  final questiontext;

  Questions(this.questiontext);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          Text(
            questiontext,
            style: TextStyle(fontSize: 30),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}