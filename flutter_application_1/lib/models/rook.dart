import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'piece.dart';

class Rook extends Piece {
  Rook(bool isWhite) : super(isWhite);

  @override
  List<int> getPossibleMoves(int index, List<Piece?> board) {
    List<int> moves = [];
    int direction = isWhite ? 1 : -1;  // 백색은 오른쪽으로, 흑색은 왼쪽으로 이동

    // 수직 이동 (위쪽/아래쪽)
    for (int i = index + 8 * direction; i >= 0 && i < 64; i += 8 * direction) {
      if (board[i] == null) {
        moves.add(i);
      } else {
        if (board[i]!.isWhite != isWhite) moves.add(i); // 상대방 말이 있는 경우
        break;
      }
    }

    // 수평 이동 (왼쪽/오른쪽)
    for (int i = index + direction; i % 8 != 0 && i % 8 != 7; i += direction) {
      if (board[i] == null) {
        moves.add(i);
      } else {
        if (board[i]!.isWhite != isWhite) moves.add(i); // 상대방 말이 있는 경우
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
  IconData getIcon(){
    return FontAwesomeIcons.chessRook;
  }
  
  @override
  Color getColor(){
    return isWhite ? Colors.orange : Colors.purple;
  }
}
