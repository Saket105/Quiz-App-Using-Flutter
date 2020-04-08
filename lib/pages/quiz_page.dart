import 'package:flutter/material.dart';
import '../ui/answer_button.dart';
import '../utils/question.dart';
import '../utils/quiz.dart';
import '../ui/question_text.dart';
import '../ui/correct.dart';
import './scores_pages.dart';

class QuizPage extends StatefulWidget {
  @override
  State createState() => new QuizPageState();
}

class QuizPageState extends State<QuizPage> {
  Question currentQuestion;
  Quiz quiz = Quiz([
    Question("  C++ is case sensitive", true),
    Question("  Is C language introduced in 1965", false),
    Question("  Only character or integer can be used in c language", false),
    Question("  #define is known as preprocessor compiler directive", true),
    Question("  A zero value is considered to be false and a non zero value is considered to be true",true),
    Question("  The return type of malloc function is void.", false),
    Question("  Algorithm is the graphical representation of logic", false),
    Question("  A zero value is considered to be false and a non-zero value is considered to be true", true),
    Question("  Blank spaces may be inserted between two words to improve the readability of the statement", true),
    Question("  The keywords cannot be used as variable names", true),
    Question("  Two case constants within the same switch statement can have the same value", false)
  ]);
  String questionText;
  int questionNumber;
  bool isCorrect;
  bool overlayShouldBeVisible = false;

  @override
  void initState() {
    super.initState();
    currentQuestion = quiz.nextQuestion;
    questionText = currentQuestion.question;
    questionNumber = quiz.questionNumber;
  }

  void handleAnswer(bool answer) {
    isCorrect = (currentQuestion.answer == answer);
    quiz.answer(isCorrect);
    this.setState(() {
      overlayShouldBeVisible = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Column(
          //This is our main page
          children: <Widget>[
            AnswerButton(true, () => handleAnswer(true)), // true button
            QuestionText(questionText, questionNumber),
            AnswerButton(false, () => handleAnswer(false)), //false button
          ],
        ),
        overlayShouldBeVisible == true
            ? CorrectWrongOverlay(isCorrect, () {
                if (quiz.length == questionNumber) {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              scorePage(quiz.score, quiz.length)),
                      (Route route) => route == null);
                  return;
                }
                currentQuestion = quiz.nextQuestion;
                this.setState(() {
                  overlayShouldBeVisible = false;
                  questionText = currentQuestion.question;
                  questionNumber = quiz.questionNumber;
                });
              })
            : Container()
      ],
    );
  }
}
