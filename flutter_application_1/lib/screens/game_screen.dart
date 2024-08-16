import 'package:flutter/material.dart';

import 'chess_board.dart';

class GameScreen extends StatelessWidget {
  final String mode;

  GameScreen({required this.mode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('체스 게임 ($mode)'),
      ),
      body: Center(
        child: const ChessBoardScreen(),
      ),
    );
  }
}