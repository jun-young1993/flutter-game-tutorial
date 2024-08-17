import 'package:flutter/material.dart';
import '../controllers/game_controller.dart';
import '../models/game_mode.dart';
import '../widgets/board_tile.dart';

class BalboGameScreen extends StatefulWidget {
  @override
  _BalboGameScreenState createState() => _BalboGameScreenState();
}

class _BalboGameScreenState extends State<BalboGameScreen> {
  late GameController _gameController;
  int crossAxisCount = 8; // 발보 체스에서 필요한 체스판 크기 설정 (가정)
  double aspectRatio = 1.0; // 적절한 비율 설정 (가정)
  int itemCount = 8 * 8; // 적절한 아이템 수 설정 (가정)

  @override
  void initState() {
    super.initState();
    _gameController = GameController();
    _gameController.selectGameMode(GameMode.balbo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('발보 체스'),
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