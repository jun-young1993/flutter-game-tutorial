import 'package:flutter_application_1/models/game_mode.dart';

import '../gsams/balbo_chess_game.dart';
import '../gsams/chess_game.dart';
import '../gsams/double_chess_game.dart';
import '../gsams/standard_chess_game.dart';

class GameController {
  ChessGame? game;

  void selectGameMode(GameMode mode) {

    switch (mode) {
      case GameMode.double:
        game = DoubleChessGame();
        break;
      case GameMode.balbo:
        game = BalboChessGame();
        break;
      default:
        game = StandardChessGame();
    }
    game?.initializeBoard();
  }

  void movePiece(int fromIndex, int toIndex) {
    game?.movePiece(fromIndex, toIndex);
  }

  List<int> getPossibleMoves(int index) {
    return game?.getPossibleMoves(index) ?? [];
  }

  bool isCheck(bool isWhite) {
    return game?.isCheck(isWhite) ?? false;
  }

  bool isCheckmate(bool isWhite) {
    return game?.isCheckmate(isWhite) ?? false;
  }

  int calculateScore(bool isWhite) {
    return game?.calculateScore(isWhite) ?? 0;
  }
}