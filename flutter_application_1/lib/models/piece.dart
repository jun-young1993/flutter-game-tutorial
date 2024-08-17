import 'dart:math';
import 'package:flutter/material.dart';

abstract class Piece {
  final bool isWhite;
  final int id;

  Piece(this.isWhite, this.id);

  List<int> getPossibleMoves(int index, List<Piece?> board);

  String getSymbol();

  IconData getIcon();

  Color getColor();
}