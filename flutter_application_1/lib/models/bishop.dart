
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'piece.dart';

class Bishop extends Piece {
  Bishop(bool isWhite) : super(isWhite);

  @override
  List<int> getPossibleMoves(int index, List<Piece?> board) {
    List<int> moves = [];
    int direction = isWhite ? 1 : -1;  // 백색은 오른쪽 아래로, 흑색은 왼쪽 위로 이동

    // 대각선 이동 (오른쪽 위/왼쪽 아래)
    for (int i = index + 9 * direction; i >= 0 && i < 64 && (i % 8 != 0); i += 9 * direction) {
      if (board[i] == null) {
        moves.add(i);
      } else {
        if (board[i]!.isWhite != isWhite) moves.add(i);
        break;
      }
    }

    // 대각선 이동 (왼쪽 위/오른쪽 아래)
    for (int i = index + 7 * direction; i >= 0 && i < 64 && (i % 8 != 7); i += 7 * direction) {
      if (board[i] == null) {
        moves.add(i);
      } else {
        if (board[i]!.isWhite != isWhite) moves.add(i);
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
  Color getColor(){
    return isWhite ? Colors.orange : Colors.purple;
  }
}
