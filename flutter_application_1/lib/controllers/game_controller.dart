import '../models/knight.dart';
import '../models/pawn.dart';
import '../models/piece.dart';
import '../models/rook.dart';
import '../models/bishop.dart';
import '../models/queen.dart';
import '../models/king.dart';

class GameController {
  List<Piece?> board = List.filled(64, null);
  bool isWhiteTurn = true; 

  Map<String, int> pieceValues = { // 체스 말의 점수
    'P': 1,
    'N': 3,
    'B': 3,
    'R': 5,
    'Q': 9,
    'K': 0, // 킹은 점수 계산에서 제외
  };

  GameController() {
    // 초기 말 배치 설정
    for (int i = 8; i < 16; i++) {
      board[i] = Pawn(true);
      board[63 - i] = Pawn(false);
    }
    board[0] = Rook(true);
    board[7] = Rook(true);
    board[56] = Rook(false);
    board[63] = Rook(false);
    board[1] = Knight(true);
    board[6] = Knight(true);
    board[57] = Knight(false);
    board[62] = Knight(false);
    board[2] = Bishop(true);
    board[5] = Bishop(true);
    board[58] = Bishop(false);
    board[61] = Bishop(false);
    board[3] = Queen(true);
    board[4] = King(true);
    board[59] = Queen(false);
    board[60] = King(false);
  }

  List<int> getPossibleMoves(int index) {
    Piece? piece = board[index];
    if (piece != null) {
      if(piece.isWhite != isWhiteTurn) return [];
      return piece.getPossibleMoves(index, board);
    }
    return [];
  }

  void movePiece(int fromIndex, int toIndex) {
    if (board[fromIndex] == null) return;
    if (board[fromIndex]!.isWhite != isWhiteTurn) return;  // 현재 턴 확인
    board[toIndex] = board[fromIndex];
    board[fromIndex] = null;
    // isWhiteTurn = !isWhiteTurn;  // 턴 전환
    endTurn();
  }

  bool isCheck(bool isWhite) {
    int kingIndex = board.indexWhere((piece) =>
        piece != null && piece.isWhite == isWhite && piece is King);

    for (int i = 0; i < board.length; i++) {
      Piece? piece = board[i];
      if (piece != null && piece.isWhite != isWhite) {
        if (piece.getPossibleMoves(i, board).contains(kingIndex)) {
          return true;
        }
      }
    }
    return false;
  }

  void endTurn() {
    if (isCheck(isWhiteTurn)) {
      if (isCheckmate(isWhiteTurn)) {
        // 체크메이트 시 게임 종료 처리
        print(isWhiteTurn ? "White is checkmated!" : "Black is checkmated!");
      } else {
        // 체크 상태 경고
        print(isWhiteTurn ? "White is in check!" : "Black is in check!");
      }
    }

    // 턴 종료 후 점수 계산
    int whiteScore = calculateScore(true);
    int blackScore = calculateScore(false);
    print("White score: $whiteScore, Black score: $blackScore");

    // 턴 전환
    isWhiteTurn = !isWhiteTurn;
  }

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

  int calculateScore(bool isWhite) {  // 점수 계산 함수
    int score = 0;
    for (Piece? piece in board) {
      if (piece != null && piece.isWhite == isWhite) {
        score += pieceValues[piece.getSymbol()] ?? 0;
      }
    }
    return score;
  }
}
