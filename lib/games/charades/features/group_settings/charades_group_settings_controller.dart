import 'package:get/get.dart';

import '../../../../core/views/assets.dart';
import '../game/data/entity/charades_team_info.dart';

class CharadesGroupSettingsController extends GetxController {
  String group1 = 'گروه اول';
  String group2 = 'گروه دوم' '';
  String group3 = 'گروه سوم';
  String group4 = 'گروه چهارم';

  final List<String> groupIcons = [
    Assets.perspectiveSpaceshipImage,
    Assets.perspectiveHeadImage,
    Assets.perspectiveRobotImage,
    Assets.perspectiveHatImage,
  ];

  final List<int> groupCounts = [2, 3, 4];

  late var selectedGroupCount = groupCounts.first.obs;

  void changeGroupCount(int gCountPos) {
    selectedGroupCount(groupCounts.elementAt(gCountPos));
  }

  bool isPosSelected(int gCountPos) => selectedGroupCount.value == groupCounts.elementAt(gCountPos);

  String getGroupCountText(int gCountPos) => groupCounts.elementAt(gCountPos).toString();

  bool saveGroupsData(String g1, String g2, String g3, String g4) {
    if (g1.isNotEmpty && g2.isNotEmpty && g3.isNotEmpty && g4.isNotEmpty) {
      group1 = g1;
      group2 = g2;
      group3 = g3;
      group4 = g4;
      return true;
    }

    return false;
  }

  List<CharadesTeamInfo> getEnteredGroups() {
    List<CharadesTeamInfo> teams = [];

    teams.addAll([
      CharadesTeamInfo(teamId: 1, teamName: group1, iconPath: groupIcons.first),
      CharadesTeamInfo(teamId: 2, teamName: group2, iconPath: groupIcons[1]),
      if (selectedGroupCount >= 3)
        CharadesTeamInfo(teamId: 3, teamName: group3, iconPath: groupIcons[2]),
      if (selectedGroupCount >= 4)
        CharadesTeamInfo(teamId: 4, teamName: group4, iconPath: groupIcons[3]),
    ]);

    return teams;
  }
}
