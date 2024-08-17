// lib/models/game_mode.dart

enum GameMode {
  standard,
  double,
  balbo,
}

extension GameModeExtension on GameMode {
  String get displayName {
    switch (this) {
      case GameMode.standard:
        return '스탠다드';
      case GameMode.double:
        return '더블 체스';
      case GameMode.balbo:
        return '발보 체스';
      default:
        return '';
    }
  }
}