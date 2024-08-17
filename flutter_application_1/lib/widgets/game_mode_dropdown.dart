import 'package:flutter/material.dart';
import '../models/game_mode.dart';

class GameModeDropdown extends StatelessWidget {
  final GameMode selectedMode;
  final ValueChanged<GameMode?> onChanged;

  const GameModeDropdown({
    required this.selectedMode,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButton<GameMode>(
      value: selectedMode,
      onChanged: onChanged,
      items: GameMode.values.map((GameMode mode) {
        return DropdownMenuItem<GameMode>(
          value: mode,
          child: Text(mode.displayName),
        );
      }).toList(),
    );
  }
}