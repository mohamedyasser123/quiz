
 import 'package:flutter/material.dart';
class Answer extends StatelessWidget {
  final String answertext;
  final VoidCallback x;

  Answer(this.x, this.answertext);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialButton(
        onPressed: x,
        color: Colors.blue,
        textColor: Colors.white,
        child: Text(answertext,style: TextStyle(fontSize: 25),),

      ),

      width: double.infinity,


    );
  }
}




