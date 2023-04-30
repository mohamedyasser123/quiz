import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizzed/models/question.dart';
import 'package:quizzed/screens/quizzs/quiz1/Questions.dart';
import 'Questions.dart';
import 'Answers.dart';

class quiz1 extends StatefulWidget {
  @override
  State<quiz1> createState() => _quiz1State();
}

class _quiz1State extends State<quiz1> {
  int _questionsindex = 0;

  void answerquestions() {
    if (_questionsindex == 3) {
      _questionsindex = -1;
    }
    setState(() {
      _questionsindex += 1;
    });
  }

  final List<Map<String, Object>> _questions = [
    {
      'questiontext': 'what color?',
      'answer': ['black', 'blue', 'white', 'yellow']
    },
    {
      'questiontext': 'what ?',
      'answer': ['black', 'blue', 'white', 'yellow']
    },
    {
      'questiontext': 'what name?',
      'answer': ['black', 'blue', 'white', 'yellow']
    },
    {
      'questiontext': 'what favorite car?',
      'answer': ['black', 'blue', 'white', 'yellow']
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz1'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Questions(_questions[_questionsindex]['questiontext']),
            ...List.from((_questions[_questionsindex]['answer'] as List<String>))
                .map((answer) {
              return Answer(answerquestions, answer);
            }).toList(),
          ],
        ),
      ),
    );
  }
}