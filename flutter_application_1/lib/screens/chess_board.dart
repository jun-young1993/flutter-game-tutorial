import 'package:flutter/material.dart';
import '../widgets/board_tile.dart';
import '../controllers/game_controller.dart';

class ChessBoardScreen extends StatefulWidget {
  const ChessBoardScreen({super.key});

  @override
  State<ChessBoardScreen> createState() => _ChessBoardScreenState();
}

class _ChessBoardScreenState extends State<ChessBoardScreen> {
  late GameController _gameController;
  int? selectedPieceIndex;
  List<int> possibleMoves = [];

  @override
  void initState() {
    super.initState();
    _gameController = GameController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
        
          return Center(
            child: AspectRatio(
              aspectRatio: 1, // 정사각형 비율 유지
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 8, // 8x8 체스판
                ),
                itemCount: 64,
                itemBuilder: (context, index) {
                  return BoardTile(
                    index: index,
                    piece: _gameController.board[index],
                    onTap: () => _handleTileTap(index),
                    isSelected: selectedPieceIndex == index,
                    isPossibleMove: possibleMoves.contains(index),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }

  void _handleTileTap(int index) {
    setState(() {
      if (selectedPieceIndex == null && _gameController.board[index] != null) {
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
    });
  }
}
