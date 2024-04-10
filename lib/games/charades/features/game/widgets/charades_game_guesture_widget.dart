import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:truth_or_dare/core/extensions/context_extensions.dart';

import '../../../../../core/views/colors.dart';
import '../charades_game_controller.dart';

class CharadesGameGuestureWidget extends StatelessWidget {
  CharadesGameGuestureWidget({super.key});
  final CharadesGameController _controller = Get.find<CharadesGameController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        context.sizedBoxWidthDefault,
        Obx(
          () => Text(
            _controller.currentWord.value,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.whiteColor,
                ),
          ),
        ),
        context.sizedBoxWidthDefault,
      ],
    );
  }
}
