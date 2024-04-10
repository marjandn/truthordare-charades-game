import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:truth_or_dare/core/extensions/context_extensions.dart';

import '../../../../../core/views/assets.dart';
import '../../../../../core/views/colors.dart';
import '../../../../shared_widgets/round_button_widget.dart';
import '../charades_game_controller.dart';
import 'charades_game_pause_menu_widget.dart';

class CharadesGameFinishedRoundInfoWidget extends StatelessWidget {
  CharadesGameFinishedRoundInfoWidget({
    super.key,
  });
  final CharadesGameController _controller = Get.find<CharadesGameController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        height: Get.height,
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(50),
            ),
            boxShadow: context.appDefaultShadow()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                    child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: 'لطفا موبایل را به ',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    TextSpan(
                      text: _controller.charadesGameInfo.value.currentTeam.teamName,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary),
                    ),
                    TextSpan(
                      text: ' بدهید و برروی دکمه روبرو ضربه بزنید.',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ]),
                )),
                RoundButtonWidget(
                  onButtonTapped: () {
                    Get.back();
                    _controller.startTimer();
                  },
                  btnColor: Theme.of(context).colorScheme.secondary,
                  btnWidget: Lottie.asset(
                    Assets.whiteArrowJson,
                    width: 50,
                  ),
                )
              ],
            ),
            context.sizedBoxHeightSmall,
            RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: 'کلمه های ',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                TextSpan(
                  text: _controller.tempCurrentTeamName,
                  style:
                      Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: ' در دور ',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                TextSpan(
                  text: _controller.tempCurrentRound.toString(),
                  style:
                      Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
              ]),
            ),
            context.sizedBoxHeightSmall,
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.primary,
                    )),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Wrap(
                    children: [
                      ..._controller.tempCorrectWords
                          .map((e) => CharadesLastWordItemWidget(
                                text: e,
                                textColor: Colors.green,
                              ))
                          .toList(),
                      ..._controller.tempWrongWords
                          .map((e) => CharadesLastWordItemWidget(
                                text: e,
                                textColor: Colors.red,
                              ))
                          .toList(),
                    ],
                  ),
                ),
              ),
            ),
            context.sizedBoxHeightDefault,
          ],
        ),
      ),
    );
  }
}
