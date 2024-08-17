import '../models/double_bishop.dart';
import '../models/double_king.dart';
import '../models/double_knight.dart';
import '../models/double_pawn.dart';
import '../models/double_queen.dart';
import '../models/double_rook.dart';
import '../models/pawn.dart';
import '../models/piece.dart';
import '../models/rook.dart';
import '../models/knight.dart';
import '../models/bishop.dart';
import '../models/queen.dart';
import '../models/king.dart';
import 'base_chess_game.dart';
class DoubleChessGame extends BaseChessGame {
  @override
  void initializeBoard() {
    board = List<Piece?>.filled(192, null); // 192칸 초기화
    isWhiteTurn = true;

    // 백색 말의 초기 배치
    List<Piece> whitePieces = [
      DoubleRook(true, 1),
      DoubleKnight(true, 2),
      DoubleBishop(true, 3),
      DoubleQueen(true, 4),
      DoubleKing(true, 5),
      DoubleBishop(true, 6),
      DoubleKnight(true, 7),
      DoubleRook(true, 8)
    ];

    // 백색 말의 초기 배치 (1, 2열)
    for (int i = 0; i < 8; i++) {
      board[i] = whitePieces[i];
      board[15 - i] = whitePieces[i]; // 역순으로 배치
    }


    // 백색 말의 초기 배치 (1, 2열)
    for (int i = 16; i < 32; i++) {
      board[i] = DoublePawn(true, i);
    }


    // 흑색 말의 초기 배치 (11, 12열)
    for (int i = 160; i < 176; i++) {
      board[i] = DoublePawn(false, i);
    }
    // 흑색 말의 초기 배치
    List<Piece> blackPieces = [
      DoubleRook(false, 1),
      DoubleKnight(false, 2),
      DoubleBishop(false, 3),
      DoubleQueen(false, 4),
      DoubleKing(false, 5),
      DoubleBishop(false, 6),
      DoubleKnight(false, 7),
      DoubleRook(false, 8)
    ];

    // 흑색 말의 초기 배치 (11, 12열)
    for (int i = 176; i < 184; i++) {
      board[i] = blackPieces[i - 176];
      board[191 - (i - 176)] = blackPieces[i - 176]; // 역순으로 배치
    }
  }

  @override
  bool isCheck(bool isWhite) {
    int king1Index = board.indexWhere((piece) =>
    piece != null && piece.isWhite == isWhite && piece is King && piece.id == 1);
    int king2Index = board.indexWhere((piece) =>
    piece != null && piece.isWhite == isWhite && piece is King && piece.id == 2);

    for (int i = 0; i < board.length; i++) {
      Piece? piece = board[i];
      if (piece != null && piece.isWhite != isWhite) {
        if (piece.getPossibleMoves(i, board).contains(king1Index) ||
            piece.getPossibleMoves(i, board).contains(king2Index)) {
          return true;
        }
      }
    }
    return false;
  }
}