import 'package:flutter/material.dart';
import '../controllers/game_controller.dart';
import '../models/game_mode.dart';
import '../widgets/board_tile.dart';

class DoubleGameScreen extends StatefulWidget {
  @override
  _DoubleGameScreenState createState() => _DoubleGameScreenState();
}

class _DoubleGameScreenState extends State<DoubleGameScreen> {
  late GameController _gameController;
  int crossAxisCount = 16; // 12x16 체스판
  double aspectRatio = 16 / 12; // 16:12 비율
  int itemCount = 16 * 12;

  @override
  void initState() {
    super.initState();
    _gameController = GameController();
    _gameController.selectGameMode(GameMode.double);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('더블 체스'),
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
              if (index >= _gameController.game!.board.length) {
                return Container(); // 인덱스 범위를 벗어난 경우 빈 컨테이너 반환
              }
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