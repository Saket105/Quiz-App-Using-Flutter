import 'package:flutter/material.dart';

class QuestionText extends StatefulWidget {
  final String _question;
  final int _questionNumber;

  QuestionText(this._question, this._questionNumber);

  @override
  State createState() => QuestionTextState();
}

class QuestionTextState extends State<QuestionText>
    with SingleTickerProviderStateMixin {
  Animation<double> _fontSizeAnimation;
  AnimationController _fontSizeAnimationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fontSizeAnimationController =
        AnimationController(duration: Duration(milliseconds: 1000), vsync: this);
    _fontSizeAnimation = CurvedAnimation(
        parent: _fontSizeAnimationController, curve: Curves.easeInCirc);
    _fontSizeAnimation.addListener(() => this.setState(() {}));
    _fontSizeAnimationController.forward();
  }

  @override

  void dispose(){
    _fontSizeAnimationController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(QuestionText oldWidget){
    super.didUpdateWidget(oldWidget);
    if(oldWidget._question != widget._question){
    _fontSizeAnimationController.reset();
    _fontSizeAnimationController.forward();
  }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.lime,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 25.0),
        child: Center(
          child: Text(
            "Statement " +
                widget._questionNumber.toString() +
                ":" +
                widget._question,
            style: TextStyle(
                fontSize: _fontSizeAnimation.value * 15,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic),
          ),
        ),
      ),
    );
  }
}
