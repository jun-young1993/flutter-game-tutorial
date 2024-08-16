import 'package:flutter/material.dart';

import 'game_screen.dart';

class GameStartScreen extends StatefulWidget {
  @override
  _GameStartScreenState createState() => _GameStartScreenState();
}

class _GameStartScreenState extends State<GameStartScreen> {
  String _selectedMode = '일반';

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('체스 게임 시작')
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              DropdownButton<String>(
                value: _selectedMode,
                onChanged: ((String? newValue){
                  setState(() {
                    _selectedMode = newValue!;
                  });
                }),
                items: <String>['일반', '랜덤 능력', '랜덤 말']
                .map<DropdownMenuItem<String>>((String value){
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              ElevatedButton(
                onPressed: () {
                  _startGame(context);
                },
                child: Text('빠른 시작'),
              ),
            ]
          )
        ]
      )
    );
  }

  void _startGame(BuildContext context) {
    // 선택된 모드에 따라 게임을 시작하는 로직
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GameScreen(mode: _selectedMode),
      ),
    );
  }

}

