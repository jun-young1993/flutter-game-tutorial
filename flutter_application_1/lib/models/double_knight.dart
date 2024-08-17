import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'piece.dart';

class DoubleKnight extends Piece {
  DoubleKnight(bool isWhite, int id) : super(isWhite, id);

  @override
  List<int> getPossibleMoves(int index, List<Piece?> board) {
    List<int> moves = [];
    int rowSize = 16;

    List<int> possibleMoves = [
      index + rowSize * 2 + 1,
      index + rowSize * 2 - 1,
      index - rowSize * 2 + 1,
      index - rowSize * 2 - 1,
      index + rowSize + 2,
      index + rowSize - 2,
      index - rowSize + 2,
      index - rowSize - 2,
    ];

    for (int move in possibleMoves) {
      if (move >= 0 && move < board.length && (board[move] == null || board[move]!.isWhite != isWhite)) {
        moves.add(move);
      }
    }

    return moves;
  }

  @override
  String getSymbol() {
    return 'N';
  }

  @override
  IconData getIcon() {
    return FontAwesomeIcons.chessKnight;
  }

  @override
  Color getColor() {
    return isWhite ? Colors.orange : Colors.purple;
  }
}