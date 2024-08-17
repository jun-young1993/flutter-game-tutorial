import 'package:flutter/material.dart';
import 'standard_game_screen.dart';
import 'double_game_screen.dart';
import 'balbo_game_screen.dart';
import '../models/game_mode.dart';
import '../widgets/game_mode_dropdown.dart';

class GameStartScreen extends StatefulWidget {
  @override
  _GameStartScreenState createState() => _GameStartScreenState();
}

class _GameStartScreenState extends State<GameStartScreen> {
  GameMode _selectedMode = GameMode.standard; // 기본값을 GameMode.standard로 설정

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('체스 게임 시작'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              GameModeDropdown(
                selectedMode: _selectedMode,
                onChanged: (GameMode? newValue) {
                  setState(() {
                    _selectedMode = newValue!;
                  });
                },
              ),
              ElevatedButton(
                onPressed: () {
                  _startGame(context);
                },
                child: Text('빠른 시작'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _startGame(BuildContext context) {
    Widget screen;

    switch (_selectedMode) {
      case GameMode.double:
        screen = DoubleGameScreen();
        break;
      case GameMode.balbo:
        screen = BalboGameScreen();
        break;
      default:
        screen = StandardGameScreen();
        break;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => screen,
      ),
    );
  }
}