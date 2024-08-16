import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'piece.dart';


class King extends Piece {
  King(bool isWhite) : super(isWhite);

  @override
  List<int> getPossibleMoves(int index, List<Piece?> board) {
    List<int> moves = [];
    List<int> possibleOffsets = isWhite
        ? [-9, -8, -7, -1, 1, 7, 8, 9]
        : [9, 8, 7, 1, -1, -7, -8, -9];  // 흑백에 따른 이동 방향 설정

    for (int offset in possibleOffsets) {
      int move = index + offset;
      if (move >= 0 && move < 64 && (move % 8 - index % 8).abs() <= 1) {
        if (board[move] == null || board[move]!.isWhite != isWhite) {
          moves.add(move);
        }
      }
    }

    return moves;
  }

  @override
  String getSymbol() {
    return 'K';
  }

  @override
  IconData getIcon(){
    return FontAwesomeIcons.chessKing;
  }

  @override
  Color getColor(){
    return isWhite ? Colors.orange : Colors.purple;
  }
}
