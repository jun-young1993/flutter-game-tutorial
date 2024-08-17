import '../models/pawn.dart';
import '../models/piece.dart';
import '../models/rook.dart';
import '../models/knight.dart';
import '../models/bishop.dart';
import '../models/queen.dart';
import '../models/king.dart';
import 'base_chess_game.dart';

class StandardChessGame extends BaseChessGame {
  @override
  void initializeBoard() {
    board = List<Piece?>.filled(64, null);
    isWhiteTurn = true;

    // 백색 말의 초기 배치
    for (int i = 8; i < 16; i++) {
      board[i] = Pawn(true, i);
      board[63 - i] = Pawn(false, i);
    }
    board[0] = Rook(true, 1);
    board[7] = Rook(true, 2);
    board[56] = Rook(false, 1);
    board[63] = Rook(false, 2);

    board[1] = Knight(true, 1);
    board[6] = Knight(true, 2);
    board[57] = Knight(false, 1);
    board[62] = Knight(false, 2);

    board[2] = Bishop(true, 1);
    board[5] = Bishop(true, 2);
    board[58] = Bishop(false, 1);
    board[61] = Bishop(false, 2);

    board[3] = Queen(true, 1);
    board[4] = King(true, 1);
    board[59] = Queen(false, 1);
    board[60] = King(false, 1);
  }
}