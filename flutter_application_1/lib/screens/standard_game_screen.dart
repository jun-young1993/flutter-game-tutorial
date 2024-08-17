import 'package:flutter/material.dart';
import '../controllers/game_controller.dart';
import '../models/game_mode.dart';
import '../widgets/board_tile.dart';

class StandardGameScreen extends StatefulWidget {
  @override
  _StandardGameScreenState createState() => _StandardGameScreenState();
}

class _StandardGameScreenState extends State<StandardGameScreen> {
  late GameController _gameController;
  int crossAxisCount = 8; // 8x8 체스판
  double aspectRatio = 1.0; // 1:1 비율
  int itemCount = 8 * 8;

  @override
  void initState() {
    super.initState();
    _gameController = GameController();
    _gameController.selectGameMode(GameMode.standard);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('스탠다드 체스'),
      ),
      body: Center(
        child: AspectRatio(
          aspectRatio: aspectRatio,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              childAspectRatio: 1.0,
            ),
            itemCount: itemCount,
            itemBuilder: (context, index) {
              return BoardTile(
                index: index,
                piece: _gameController.game?.board[index],
                onTap: () {
                  setState(() {
                    _handleTileTap(index);
                  });
                },
                crossAxisCount: crossAxisCount,
                isSelected: selectedPieceIndex == index,
                isPossibleMove: possibleMoves.contains(index),
              );
            },
          ),
        ),
      ),
    );
  }

  void _handleTileTap(int index) {
    if (selectedPieceIndex == null && _gameController.game?.board[index] != null) {
      selectedPieceIndex = index;
      possibleMoves = _gameController.getPossibleMoves(index);
    } else if (selectedPieceIndex != null && possibleMoves.contains(index)) {
      _gameController.movePiece(selectedPieceIndex!, index);
      selectedPieceIndex = null;
      possibleMoves.clear();
    } else {
      selectedPieceIndex = null;
      possibleMoves.clear();
    }
  }

  int? selectedPieceIndex;
  List<int> possibleMoves = [];
}