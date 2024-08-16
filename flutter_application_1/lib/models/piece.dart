import 'package:flutter/material.dart';

abstract class Piece {
  final bool isWhite;

  Piece(this.isWhite);

  List<int> getPossibleMoves(int index, List<Piece?> board);

  String getSymbol();  

  IconData getIcon();

  Color getColor();
}