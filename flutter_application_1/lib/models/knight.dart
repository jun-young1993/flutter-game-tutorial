import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'piece.dart';

class Knight extends Piece {
  Knight(bool isWhite) : super(isWhite);

  @override
  List<int> getPossibleMoves(int index, List<Piece?> board) {
    List<int> moves = [];
    List<int> offsets = isWhite
        ? [-17, -15, -10, -6, 6, 10, 15, 17]
        : [17, 15, 10, 6, -6, -10, -15, -17];  // 흑백에 따른 이동 방향 설정

    for (int offset in offsets) {
      int move = index + offset;
      if (move >= 0 && move < 64 && (move % 8 - index % 8).abs() <= 2) {
        if (board[move] == null || board[move]!.isWhite != isWhite) {
          moves.add(move);
        }
      }
    }

    return moves;
  }

  @override
  String getSymbol() {
    return 'N';
  }

  @override
  IconData getIcon(){ 
    return FontAwesomeIcons.chessKnight;
  }

  @override
  Color getColor(){
    return isWhite ? Colors.orange : Colors.purple;
  }
}
