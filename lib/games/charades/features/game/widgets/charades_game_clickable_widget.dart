import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:truth_or_dare/core/extensions/context_extensions.dart';

import '../../../../../core/views/assets.dart';
import '../../../../../core/views/colors.dart';
import '../charades_game_controller.dart';

class CharadesGameClickable extends StatelessWidget {
  CharadesGameClickable({super.key});
  final CharadesGameController _controller = Get.find<CharadesGameController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        context.sizedBoxWidthDefault,
        GestureDetector(
          onTap: () => _controller.addCorrectWord(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('درست حدس زدم',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: AppColors.whiteColor,
                      )),
              Image.asset(
                Assets.tappedImage,
                width: 20,
              ),
            ],
          ),
        ),
        Expanded(
          child: Obx(
            () => Text(
              _controller.currentWord.value,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.whiteColor,
                  ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () => _controller.addWrongWord(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('غلط حدس زدم',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: AppColors.whiteColor,
                      )),
              Image.asset(
                Assets.tappedImage,
                width: 20,
              ),
            ],
          ),
        ),
        context.sizedBoxWidthDefault,
      ],
    );
  }
}
