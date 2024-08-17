import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'piece.dart';

class DoubleBishop extends Piece {
  DoubleBishop(bool isWhite, int id) : super(isWhite, id);

  @override
  List<int> getPossibleMoves(int index, List<Piece?> board) {
    List<int> moves = [];
    int rowSize = 16;

    // 대각선 이동
    for (int i = index + rowSize + 1; i < board.length && i % rowSize != 0; i += rowSize + 1) {
      if (board[i] == null) {
        moves.add(i);
      } else {
        if (board[i]!.isWhite != isWhite) {
          moves.add(i);
        }
        break;
      }
    }
    for (int i = index + rowSize - 1; i < board.length && i % rowSize != rowSize - 1; i += rowSize - 1) {
      if (board[i] == null) {
        moves.add(i);
      } else {
        if (board[i]!.isWhite != isWhite) {
          moves.add(i);
        }
        break;
      }
    }
    for (int i = index - rowSize + 1; i >= 0 && i % rowSize != 0; i -= rowSize - 1) {
      if (board[i] == null) {
        moves.add(i);
      } else {
        if (board[i]!.isWhite != isWhite) {
          moves.add(i);
        }
        break;
      }
    }
    for (int i = index - rowSize - 1; i >= 0 && i % rowSize != rowSize - 1; i -= rowSize + 1) {
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
    return 'B';
  }

  @override
  IconData getIcon() {
    return FontAwesomeIcons.chessBishop;
  }

  @override
  Color getColor() {
    return isWhite ? Colors.orange : Colors.purple;
  }
}