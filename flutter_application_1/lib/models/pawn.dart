import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'piece.dart';

class Pawn extends Piece {
  Pawn(bool isWhite) : super(isWhite);

  @override
  List<int> getPossibleMoves(int index, List<Piece?> board) {
      int direction = isWhite ? 8 : -8;

      List<int> moves = [];
      if(
        index + direction >= 0 && 
        index + direction < 64 &&
        board[index+direction] == null
      ){
        moves.add(index + direction);
      }
      // 대각선 공격 (왼쪽)
      if (index % 8 != 0 && index + direction - 1 >= 0 && index + direction - 1 < 64 &&
          board[index + direction - 1] != null && board[index + direction - 1]!.isWhite != isWhite) {
        moves.add(index + direction - 1);
      }

      // 대각선 공격 (오른쪽)
      if (index % 8 != 7 && index + direction + 1 >= 0 && index + direction + 1 < 64 &&
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