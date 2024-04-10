import 'dart:async';
import 'dart:math';

import 'package:get/get.dart';
import 'package:pausable_timer/pausable_timer.dart';
import 'package:truth_or_dare/games/charades/features/game/data/entity/charades_game_info.dart';
import 'package:truth_or_dare/games/charades/features/game/widgets/charades_game_finished_round_info_widget.dart';
import 'package:truth_or_dare/games/charades/features/game/widgets/charades_game_win_menu_widget.dart';
import 'package:truth_or_dare/games/charades/features/game_categories_settings/charades_categories_controller.dart';
import 'package:truth_or_dare/games/charades/features/game_settings/charades_settings_controller.dart';
import 'package:truth_or_dare/games/charades/features/group_settings/charades_group_settings_controller.dart';

import 'data/entity/charades_team_info.dart';

class CharadesGameController extends GetxController {
  int timerDuration =   Get.find<CharadesSettingsController>().getTimerDurationInSecond();

  List<String> words = Get.find<CharadesCategoriesController>().getSelectedWords();
  List<CharadesTeamInfo> teams = Get.find<CharadesGroupSettingsController>().getEnteredGroups();

  var currentWord = ''.obs;
  Random random = Random();
  late PausableTimer timer;
  var timerText = ''.obs;

  late final charadesGameInfo = CharadesGameInfo(
    timerDuration: timerDuration,
    gameRounds: Get.find<CharadesSettingsController>().selectedRoundItem.value,
    currentRound: 1,
    currentTeam: teams.first,
  ).obs;

  bool finishGame = false;

  List<String> tempCorrectWords = [];
  List<String> tempWrongWords = [];
  String tempCurrentTeamName = '';
  int tempCurrentRound = 0;

  reStartGame() {
    words = Get.find<CharadesCategoriesController>().getSelectedWords();
    teams = Get.find<CharadesGroupSettingsController>().getEnteredGroups();
    charadesGameInfo.value.currentRound = 1;
    charadesGameInfo.value.currentTeam = teams.first;
    charadesGameInfo.refresh();

    currentWord('');
    timerText('');
    finishGame = false;
    startTimer();
  }

  startTimer() {
    print(timerDuration.toString());
    if (!finishGame) {
      int manipulateTimeDuration = timerDuration;
      _emptyTempValues();
      _getNextWord();

      timer = PausableTimer(
        const Duration(seconds: 1),
        () {
          if (manipulateTimeDuration > 0) {
            manipulateTimeDuration--;
            timerText(manipulateTimeDuration.toString());

            timer
              ..reset()
              ..start();
          } else {
            timer.cancel();
            tempCurrentTeamName = charadesGameInfo.value.currentTeam.teamName;
            tempCurrentRound = charadesGameInfo.value.currentRound;
            _forwardGame();
            Get.dialog(CharadesGameFinishedRoundInfoWidget(), barrierDismissible: false);
          }
        },
      );

      timer.start();
    }
  }

  _emptyTempValues() {
    tempCorrectWords = [];
    tempWrongWords = [];
    tempCurrentTeamName = '';
    tempCurrentRound = 0;
  }

  _getNextWord() {
    int randomPos = random.nextInt(words.length);
    currentWord(words[randomPos]);
    words.removeAt(randomPos);
  }

  addCorrectWord() {
    tempCorrectWords.add(currentWord.value);

    charadesGameInfo.value.currentTeam.currectWords.add(currentWord.value);
    charadesGameInfo.refresh();

    _getNextWord();
  }

  addWrongWord() {
    tempWrongWords.add(currentWord.value);

    charadesGameInfo.value.currentTeam.wrongWords.add(currentWord.value);
    charadesGameInfo.refresh();

    _getNextWord();
  }

  _forwardGame() {
    if (charadesGameInfo.value.currentTeam.teamId == teams.last.teamId) {
      if (charadesGameInfo.value.isFinish) {
        finishGame = true;
        Get.dialog(
            CharadesGameWinMenuWidget(
              winnerGroupName: _getWinnderGroupName(),
              punish: Get.find<CharadesSettingsController>().punishText,
              onRedoClick: () {
                reStartGame();
              },
            ),
            barrierDismissible: false);
      } else {
        charadesGameInfo.value.currentRound++;
        charadesGameInfo.value.currentTeam = teams.first;
        charadesGameInfo.refresh();
      }
    } else {
      charadesGameInfo.value.currentTeam = teams.elementAt((teams.indexWhere(
              (element) => element.teamId == charadesGameInfo.value.currentTeam.teamId) +
          1));
      charadesGameInfo.refresh();
    }
  }

  String _getWinnderGroupName() {
    CharadesTeamInfo winnerGroup = teams.first;

    for (var element in teams.sublist(1)) {
      if ((element.currectWords.length > winnerGroup.currectWords.length) ||
          ((element.currectWords.length == winnerGroup.currectWords.length) &&
              (element.wrongWords.length < winnerGroup.wrongWords.length))) {
        winnerGroup = element;
      }
    }

    return winnerGroup.teamName;
  }

  List<String> getAllLastWords() => [
        ...teams.first.currectWords,
        ...teams.first.wrongWords,
        ...teams.elementAt(1).currectWords,
        ...teams.elementAt(1).wrongWords,
        if (teams.length >= 3) ...teams.elementAt(2).currectWords,
        if (teams.length >= 3) ...teams.elementAt(2).currectWords,
        if (teams.length >= 4) ...teams.elementAt(3).currectWords,
        if (teams.length >= 4) ...teams.elementAt(3).wrongWords,
      ];
}
