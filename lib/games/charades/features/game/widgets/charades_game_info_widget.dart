import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:truth_or_dare/games/charades/features/game/widgets/charades_game_pause_menu_widget.dart';

import '../../../../../core/views/assets.dart';
import '../../../../../core/views/colors.dart';
import '../../../../shared_widgets/round_button_widget.dart';
import '../charades_game_controller.dart';

class CharadesGameInfoWidget extends StatelessWidget {
  CharadesGameInfoWidget({super.key, this.showPauseButton = true});

  final bool showPauseButton;

  final CharadesGameController _controller = Get.find<CharadesGameController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
            child: Obx(
          () => Row(
            children: [
              Text(
                'دور ${_controller.charadesGameInfo.value.currentRound}:  ',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(fontWeight: FontWeight.bold, color: AppColors.whiteColor),
              ),
              Image.asset(
                _controller.charadesGameInfo.value.currentTeam.iconPath,
                width: 35,
              ),
              Text(
                _controller.charadesGameInfo.value.currentTeam.teamName,
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(fontWeight: FontWeight.bold, color: AppColors.whiteColor),
              ),
            ],
          ),
        )),
        Visibility(
          visible: showPauseButton,
          child: RoundButtonWidget(
            onButtonTapped: () {
              _controller.timer.pause();
              Get.dialog(
                  CharadesGamePauseMenuWidget(
                    onResumeClick: () {
                      _controller.timer.start();
                    },
                    onRedoClick: () {
                      _controller.reStartGame();
                    },
                    lastWords: _controller.getAllLastWords(),
                  ),
                  barrierDismissible: false);
            },
            btnIconPath: Assets.playIcon,
            iconSize: 20,
            btnIconColor: AppColors.whiteColor,
            btnColor: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ],
    );
  }
}
