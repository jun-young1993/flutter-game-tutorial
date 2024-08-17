import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'piece.dart';

class DoubleKing extends Piece {
  DoubleKing(bool isWhite, int id) : super(isWhite, id);

  @override
  List<int> getPossibleMoves(int index, List<Piece?> board) {
    List<int> moves = [];
    int rowSize = 16;

    List<int> possibleMoves = [
      index + rowSize,
      index - rowSize,
      index + 1,
      index - 1,
      index + rowSize + 1,
      index + rowSize - 1,
      index - rowSize + 1,
      index - rowSize - 1,
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
    return 'K';
  }

  @override
  IconData getIcon() {
    return FontAwesomeIcons.chessKing;
  }

  @override
  Color getColor() {
    return isWhite ? Colors.orange : Colors.purple;
  }
}