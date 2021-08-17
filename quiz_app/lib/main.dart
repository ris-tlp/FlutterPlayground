import "package:flutter/material.dart";

import "question.dart";
import "answer.dart";

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  final questions = const [
    {
      "questionText": "What's your favorite color?",
      "answers": ["Black", "Red", "Green", "White"]
    },
    {
      "questionText": "What's your favorite animal?",
      "answers": ["Rabbit", "Snake", "Elephant", "Lion"]
    },
    {
      "questionText": "What's your favorite food?",
      "answers": ["Biryani", "Biryani", "Biryani", "Biryani"]
    }
  ];

  void _answerQuestion() {
    if (_questionIndex < questions.length)
      setState(() {
        _questionIndex = _questionIndex + 1;
      });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Quiz!"),
        ),
        body: Column(
          children: <Widget>[
            Question(
              questions[_questionIndex]["questionText"] as String,
            ),
            ...(questions[_questionIndex]["answers"] as List<String>)
                .map((answer) {
              return Answer(_answerQuestion, answer);
            }).toList()
          ],
        ),
      ),
    );
  }
}
