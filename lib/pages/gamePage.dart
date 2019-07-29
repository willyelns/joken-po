import 'dart:math';

import 'package:flutter/material.dart';
import 'package:jokenpo/widgets/joken-po-button.dart';

class GamePage extends StatefulWidget {
  final String title;

  const GamePage({Key key, this.title}) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
}

enum JokenOptions { rock, paper, scissors }

class _GamePageState extends State<GamePage> {
  AssetImage _imageApp = AssetImage('assets/images/default.png');
  String _responseMessage = 'Choose an option below';

  void _selectedOption(JokenOptions option) {
    JokenOptions appChoice = this._generateAnOption();
    setState(() {
      this._imageApp = this._getAppImageChoice(appChoice);
      this._responseMessage = this._gameWinner(appChoice, option);
    });
  }

  JokenOptions _generateAnOption() {
    List<JokenOptions> types = [
      JokenOptions.rock,
      JokenOptions.paper,
      JokenOptions.scissors
    ];
    int randomNumber = Random().nextInt(types.length);
    return types[randomNumber];
  }

  AssetImage _getAppImageChoice(JokenOptions option) {
    switch (option) {
      case JokenOptions.paper:
        return AssetImage('assets/images/paper.png');
      case JokenOptions.rock:
        return AssetImage('assets/images/rock.png');
      default:
        return AssetImage('assets/images/scissors.png');
    }
  }

  String _gameWinner(JokenOptions appChoice, JokenOptions userChoice) {
    Map<String, String> responses = {
      'win': 'Congrats, you win :)',
      'lost': 'Bad news, you lost :(',
      'draw': 'Well, no one wins, try again ;)',
    };
    String feedback = responses['draw'];

    if ((userChoice == JokenOptions.rock &&
            appChoice == JokenOptions.scissors) ||
        (userChoice == JokenOptions.scissors &&
            appChoice == JokenOptions.paper) ||
        (userChoice == JokenOptions.paper && appChoice == JokenOptions.rock)) {
      feedback = responses['win'];
    } else if ((appChoice == JokenOptions.rock &&
            userChoice == JokenOptions.scissors) ||
        (appChoice == JokenOptions.scissors &&
            userChoice == JokenOptions.paper) ||
        (appChoice == JokenOptions.paper && userChoice == JokenOptions.rock)) {
      feedback = responses['lost'];
    }
    return feedback;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Text(
                'App\'s choice:',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Image(image: _imageApp),
            Padding(
              padding: const EdgeInsets.only(bottom: 16, top: 32),
              child: Text(
                _responseMessage,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                JokenPoButton(
                  imagePath: 'assets/images/rock.png',
                  callbackFunction: () => _selectedOption(JokenOptions.rock),
                ),
                JokenPoButton(
                  imagePath: 'assets/images/paper.png',
                  callbackFunction: () => _selectedOption(JokenOptions.paper),
                ),
                JokenPoButton(
                  imagePath: 'assets/images/scissors.png',
                  callbackFunction: () =>
                      _selectedOption(JokenOptions.scissors),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
