class CharadesTeamInfo {
  final int teamId;
  final String teamName;
  final String iconPath;
  List<String> currectWords = [];
  List<String> wrongWords = [];

  CharadesTeamInfo({
    required this.teamId,
    required this.teamName,
    required this.iconPath,
  });
}
