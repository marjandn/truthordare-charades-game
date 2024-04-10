import 'package:get/get.dart';
import 'package:truth_or_dare/games/charades/features/game_settings/data/entity/game_settings.dart';

class CharadesSettingsController extends GetxController {
  final List<GameSettings> timerItems = [
    GameSettings(displayedText: '2 دقیقه', value: 2),
    GameSettings(displayedText: '4 دقیقه', value: 4),
    GameSettings(displayedText: '6 دقیقه', value: 6),
  ];

  late GameSettings selectedTimerDuration = timerItems.first;
  final List<GameSettings> difficultlyItems = [
    GameSettings(displayedText: 'آسان', value: 2),
    GameSettings(displayedText: 'متوسط', value: 4),
    GameSettings(displayedText: 'سخت', value: 6),
  ];
  late GameSettings selectedDifficultlyItem = difficultlyItems.first;

  final List<GameSettings> roundItems = [
    GameSettings(displayedText: '2 دور', value: 2),
    GameSettings(displayedText: '4 دور', value: 4),
    GameSettings(displayedText: '6 دور', value: 6),
  ];
  late GameSettings selectedRoundItem = roundItems.first;

  String punishText = '';

  int getTimerDurationInSecond() {
    int timerDuration =
        (((selectedTimerDuration.value * 60) / selectedRoundItem.value) as double).round();

    return timerDuration;
  }
}
