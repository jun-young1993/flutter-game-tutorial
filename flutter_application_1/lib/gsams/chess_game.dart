import '../models/piece.dart';

abstract class ChessGame {
  late List<Piece?> board;
  late bool isWhiteTurn;

  void initializeBoard();
  List<int> getPossibleMoves(int index);
  void movePiece(int fromIndex, int toIndex);
  bool isCheck(bool isWhite);
  bool isCheckmate(bool isWhite);
  int calculateScore(bool isWhite);
}