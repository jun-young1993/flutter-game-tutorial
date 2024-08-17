import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'piece.dart';
import 'double_rook.dart';
import 'double_bishop.dart';

class DoubleQueen extends Piece {
  DoubleQueen(bool isWhite, int id) : super(isWhite, id);

  @override
  List<int> getPossibleMoves(int index, List<Piece?> board) {
    List<int> moves = [];
    DoubleRook rookMoves = DoubleRook(isWhite, id);
    DoubleBishop bishopMoves = DoubleBishop(isWhite, id);

    moves.addAll(rookMoves.getPossibleMoves(index, board));
    moves.addAll(bishopMoves.getPossibleMoves(index, board));

    return moves;
  }

  @override
  String getSymbol() {
    return 'Q';
  }

  @override
  IconData getIcon() {
    return FontAwesomeIcons.chessQueen;
  }

  @override
  Color getColor() {
    return isWhite ? Colors.orange : Colors.purple;
  }
}