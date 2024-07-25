import 'package:flutter/material.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/question_screen.dart';
import 'package:quiz_app/data/IS_topic4.dart';
import 'package:quiz_app/result_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  //Widget? activeScreen;
  var activeScreen = 'start-screen';

  /*@override
  void initState() {
    //do additional initialization work like constructors, execute before the build method run
    activeScreen = StartScreen(switchScreen);
    super.initState();
  }
  */

  void switchScreen() {
    setState(
      () {
        //activeScreen = const QuestionScreen();
        activeScreen = 'questions-screen';
      },
    );
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        //selectedAnswers = [];
        activeScreen = 'result-screen';
      });
    }
  }

  void restartQuiz() {
    selectedAnswers = [];
    setState(() {
      activeScreen = 'start-screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionScreen(onSelectAnswer: chooseAnswer);
    } else if (activeScreen == 'result-screen') {
      screenWidget = ResultScreen(
          chosenAnswers: selectedAnswers, restartQuiz: restartQuiz);
    } else if (activeScreen == 'start-screen') {
      screenWidget = StartScreen(switchScreen);
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 154, 203, 230),
                Color.fromARGB(255, 173, 233, 224),
              ],
              begin: AlignmentDirectional.topStart,
              end: AlignmentDirectional.bottomCenter,
            ),
          ),
          //child: activeScreen,
          child: screenWidget,
          //build
        ),
      ),
    );
  }
}
