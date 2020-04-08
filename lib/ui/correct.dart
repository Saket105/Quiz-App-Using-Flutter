import 'package:flutter/material.dart';
import 'dart:math';

class CorrectWrongOverlay extends StatefulWidget {
  final bool _isCorrect;
  final VoidCallback _onTap;


  CorrectWrongOverlay(this._isCorrect, this._onTap);
  @override
  State createState() =>  CorrectWrongOverlayState();
}

class CorrectWrongOverlayState extends State<CorrectWrongOverlay>
    with SingleTickerProviderStateMixin {
       Animation<double> _iconAnimation;
       AnimationController _iconAnimationController;

  @override
  void initState() {
    
    super.initState();
    _iconAnimationController =
        AnimationController(duration: Duration(seconds: 2), vsync: this);
    _iconAnimation = CurvedAnimation(
        parent: _iconAnimationController, curve: Curves.elasticOut);
    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
  }

  @override
  void dispose(){
    _iconAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    return Material(
      color: Colors.black54,
      child: InkWell(
        onTap: () => widget._onTap(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration:
                  BoxDecoration(color: Colors.white,
                   shape: BoxShape.circle
                   ),
              child: Transform.rotate(
                angle: _iconAnimation.value * 2 * 3.14,
                child: Icon(
                  widget._isCorrect == true ? Icons.thumb_up : Icons.thumb_down,
                  size:_iconAnimation.value * 80.0 ,
                  color: Colors.deepOrange,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20.0),
            ),
            Text(
              widget._isCorrect == true ? "Correct!" : "Wrong!",
              style: TextStyle(
                  fontSize: 30.0,
                  fontStyle: FontStyle.italic,
                  color: Colors.deepOrange,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
