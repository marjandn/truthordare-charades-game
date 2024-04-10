import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:truth_or_dare/core/extensions/context_extensions.dart';

import '../../../../../core/views/assets.dart';
import '../../../../../core/views/colors.dart';
import '../charades_game_controller.dart';

class CharadesGamePointsWidget extends StatelessWidget {
  CharadesGamePointsWidget({super.key});

  final CharadesGameController _controller = Get.find<CharadesGameController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            Image.asset(
              Assets.tickIcon,
              width: 30,
            ),
            context.sizedBoxWidthMicro,
            Obx(
              () => RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(children: [
                    TextSpan(
                      text: "تعداد کلمات درست: ",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    TextSpan(
                      text: _controller.charadesGameInfo.value.currentTeam.currectWords.length
                          .toString()
                          .toString(),
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ])),
            ),
          ],
        ),
        Expanded(
          child: Obx(
            () => Text(
              _controller.timerText.value,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium
                  ?.copyWith(fontWeight: FontWeight.bold, color: AppColors.blackColor),
            ),
          ),
        ),
        Row(
          children: [
            Image.asset(
              Assets.wrongIcon,
              width: 30,
            ),
            context.sizedBoxWidthMicro,
            Obx(
              () => RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(children: [
                    TextSpan(
                      text: "تعداد کلمات غلط: ",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    TextSpan(
                      text: _controller.charadesGameInfo.value.currentTeam.wrongWords.length
                          .toString(),
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ])),
            ),
          ],
        )
      ],
    );
  }
}
