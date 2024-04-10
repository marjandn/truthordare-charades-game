import 'package:truth_or_dare/games/charades/features/game/data/entity/charades_team_info.dart';

class CharadesGameInfo {
  final int timerDuration;
  final int gameRounds;
  int currentRound;
  CharadesTeamInfo currentTeam;

  bool get isFinish => currentRound >= gameRounds;

  CharadesGameInfo(
      {required this.timerDuration,
      required this.gameRounds,
      required this.currentRound,
      required this.currentTeam});

  goNextRound() {
    currentRound++;
  }

  changeTeam(CharadesTeamInfo team) {
    currentTeam = team;
  }
}
