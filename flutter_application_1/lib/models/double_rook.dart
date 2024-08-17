import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'piece.dart';

class DoubleRook extends Piece {
  DoubleRook(bool isWhite, int id) : super(isWhite, id);

  @override
  List<int> getPossibleMoves(int index, List<Piece?> board) {
    List<int> moves = [];
    int rowSize = 16;

    // 수평 이동
    for (int i = index + 1; i < index - index % rowSize + rowSize; i++) {
      if (board[i] == null) {
        moves.add(i);
      } else {
        if (board[i]!.isWhite != isWhite) {
          moves.add(i);
        }
        break;
      }
    }
    for (int i = index - 1; i >= index - index % rowSize; i--) {
      if (board[i] == null) {
        moves.add(i);
      } else {
        if (board[i]!.isWhite != isWhite) {
          moves.add(i);
        }
        break;
      }
    }

    // 수직 이동
    for (int i = index + rowSize; i < board.length; i += rowSize) {
      if (board[i] == null) {
        moves.add(i);
      } else {
        if (board[i]!.isWhite != isWhite) {
          moves.add(i);
        }
        break;
      }
    }
    for (int i = index - rowSize; i >= 0; i -= rowSize) {
      if (board[i] == null) {
        moves.add(i);
      } else {
        if (board[i]!.isWhite != isWhite) {
          moves.add(i);
        }
        break;
      }
    }

    return moves;
  }

  @override
  String getSymbol() {
    return 'R';
  }

  @override
  IconData getIcon() {
    return FontAwesomeIcons.chessRook;
  }

  @override
  Color getColor() {
    return isWhite ? Colors.orange : Colors.purple;
  }
}