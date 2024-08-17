import '../models/king.dart';
import '../models/piece.dart';
import 'chess_game.dart';

abstract class BaseChessGame implements ChessGame {
  @override
  late List<Piece?> board;
  @override
  late bool isWhiteTurn;

  @override
  void initializeBoard(); // 각 변형 체스에서 구현

  @override
  List<int> getPossibleMoves(int index) {
    Piece? piece = board[index];
    if (piece != null) {
      return piece.getPossibleMoves(index, board);
    }
    return [];
  }

  @override
  void movePiece(int fromIndex, int toIndex) {
    if (board[fromIndex] == null) return;
    if (board[fromIndex]!.isWhite != isWhiteTurn) return;

    board[toIndex] = board[fromIndex];
    board[fromIndex] = null;

    isWhiteTurn = !isWhiteTurn;
  }

  @override
  bool isCheck(bool isWhite) {
    int king1Index = board.indexWhere((piece) =>
    piece != null && piece.isWhite == isWhite && piece is King);

    for (int i = 0; i < board.length; i++) {
      Piece? piece = board[i];
      if (piece != null && piece.isWhite != isWhite) {
        if (piece.getPossibleMoves(i, board).contains(king1Index)) {
          return true;
        }
      }
    }
    return false;
  }

  @override
  bool isCheckmate(bool isWhite) {
    if (!isCheck(isWhite)) return false;

    for (int i = 0; i < board.length; i++) {
      Piece? piece = board[i];
      if (piece != null && piece.isWhite == isWhite) {
        List<int> moves = piece.getPossibleMoves(i, board);
        for (int move in moves) {
          Piece? capturedPiece = board[move];
          board[move] = piece;
          board[i] = null;

          bool check = isCheck(isWhite);
          board[i] = piece;
          board[move] = capturedPiece;

          if (!check) return false;
        }
      }
    }
    return true;
  }

  @override
  int calculateScore(bool isWhite) {
    Map<String, int> pieceValues = {
      'P': 1,
      'N': 3,
      'B': 3,
      'R': 5,
      'Q': 9,
      'K': 0,
    };

    int score = 0;
    for (Piece? piece in board) {
      if (piece != null && piece.isWhite == isWhite) {
        score += pieceValues[piece.getSymbol()] ?? 0;
      }
    }
    return score;
  }
}