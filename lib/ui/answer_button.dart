import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final bool _answer;
  final VoidCallback _onTap;

  AnswerButton(this._answer, this._onTap);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: _answer == true ? Colors.blueAccent : Colors.redAccent,
        child: InkWell(
            onTap: () => _onTap(),
            splashColor: Colors.deepPurple,
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black87, width: 6.0)),
                    padding: EdgeInsets.all(25.0),
                child: Text(
                  _answer == true ? "True" : "False",
                  style: TextStyle(
                      color: Colors.yellow,
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                ),
              ),
            )),
      ),
    );
  }
}
