import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'piece.dart';
import 'rook.dart';
import 'bishop.dart';

class Queen extends Piece {
  Queen(bool isWhite) : super(isWhite);

  @override
  List<int> getPossibleMoves(int index, List<Piece?> board) {
    List<int> moves = [];
    // 퀸은 룩과 비숍의 움직임을 모두 가짐
    Rook rookMoves = Rook(isWhite);
    Bishop bishopMoves = Bishop(isWhite);
    moves.addAll(rookMoves.getPossibleMoves(index, board));
    moves.addAll(bishopMoves.getPossibleMoves(index, board));
    return moves;
  }

  @override
  String getSymbol() {
    return 'Q';
  }

  @override
  IconData getIcon(){
    return FontAwesomeIcons.chessQueen;
  }

  @override
  Color getColor(){
    return isWhite ? Colors.orange : Colors.purple;
  }
}
