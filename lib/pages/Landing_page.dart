import 'package:flutter/material.dart';
import './quiz_page.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.indigo,
      child: InkWell(
        onTap: () => Navigator.of(context).push(new MaterialPageRoute(
            builder: (BuildContext context) => QuizPage())),
            splashColor: Colors.yellowAccent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Let's Start Our Quizzzz",
              style: TextStyle(
                  color: Colors.yellow,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "Tap to Start!",
              style: TextStyle(
                  color: Colors.red,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
