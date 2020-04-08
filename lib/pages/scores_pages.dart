import 'package:flutter/material.dart';
import './Landing_page.dart';

class scorePage extends StatelessWidget {
  final int score;
  final int totalQuestions;
  scorePage(this.score, this.totalQuestions);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.indigoAccent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Your Score is :",
            style: TextStyle(
              fontSize: 40.0,
              fontWeight: FontWeight.bold,
              color: Colors.yellow,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: Text(
              score.toString() + "/" + totalQuestions.toString(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.yellow,
                fontSize: 45.0,
              ),
            ),
          ),
          new Center(
              child: score >=7 == true
                  ? new Container(
                      child: Text("Tu to Baap nikla!",
                      style: TextStyle(color: Colors.yellow,
                      fontSize: 45.0,
                      fontWeight: FontWeight.bold),
                      ),
                    )
                  : new Container(
                      child: Text("Tere se na hoga beta!",
                       style: TextStyle(color: Colors.yellow,
                      fontSize: 45.0,
                      fontWeight: FontWeight.bold),
                      ),
                    )),
          IconButton(
            icon: Icon(Icons.book),
            color: Colors.cyan,
            iconSize: 50.0,
            onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                    builder: (BuildContext context) => LandingPage()),
                (Route route) => route == null),
          )
        ],
      ),
    );
  }
}
