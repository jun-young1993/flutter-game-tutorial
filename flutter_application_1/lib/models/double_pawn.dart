import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'piece.dart';

class DoublePawn extends Piece {
  DoublePawn(bool isWhite, int id) : super(isWhite, id);

  @override
  List<int> getPossibleMoves(int index, List<Piece?> board) {
      int boardSize = 192;
      int rowSize = 16;
      int direction = isWhite ? rowSize : -rowSize;

      List<int> moves = [];

      // 전진
      if (index + direction >= 0 && index + direction < boardSize && board[index + direction] == null) {
        moves.add(index + direction);
      }

      // 대각선 공격 (왼쪽)
      if (index % rowSize != 0 && index + direction - 1 >= 0 && index + direction - 1 < boardSize &&
          board[index + direction - 1] != null && board[index + direction - 1]!.isWhite != isWhite) {
        moves.add(index + direction - 1);
      }

      // 대각선 공격 (오른쪽)
      if (index % rowSize != rowSize - 1 && index + direction + 1 >= 0 && index + direction + 1 < boardSize &&
          board[index + direction + 1] != null && board[index + direction + 1]!.isWhite != isWhite) {
        moves.add(index + direction + 1);
      }
      return moves;
  }

  @override
  String getSymbol() {
    return 'P';
  }

  @override
  IconData getIcon() {
    return FontAwesomeIcons.chessPawn;
  }

  @override
  Color getColor(){
    return isWhite ? Colors.orange : Colors.purple;
  }
}