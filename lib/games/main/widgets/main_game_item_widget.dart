import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:truth_or_dare/core/extensions/context_extensions.dart';

import '../../../core/views/assets.dart';
import '../../../core/views/colors.dart';
import '../../shared_widgets/round_button_widget.dart';

class MainGameItemWidget extends StatelessWidget {
  final Function onPlayTapped;
  final Function onGuaideTapped;
  final Function onAddTapped;
  final String title;
  final String animPath;
  final double animWidth;

  const MainGameItemWidget({
    super.key,
    required this.onPlayTapped,
    required this.onGuaideTapped,
    required this.onAddTapped,
    required this.title,
    required this.animPath,
    required this.animWidth,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Stack(
        children: [
          Transform(
            transform: Matrix4.skew(-0.05, 0.08),
            child: Image.asset(
              Assets.dashboardItemBg,
              width: Get.width * 0.9,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 32,
              top: 6,
              bottom: 16,
            ),
            child: Image.asset(
              Assets.dashboardItemBg,
              width: Get.width * 0.8,
            ),
          ),
          Positioned(
              top: 60,
              right: 120,
              child: Text(
                title,
                style:
                    Theme.of(context).textTheme.titleLarge?.copyWith(color: AppColors.whiteColor),
              )),
          Positioned(
            right: 32,
            top: 50,
            child: Column(children: [
              RoundButtonWidget(
                onButtonTapped: () {
                  onPlayTapped();
                },
                btnIconPath: Assets.playIcon,
                btnIconColor: AppColors.whiteColor,
                btnColor: AppColors.accentColor,
                iconSize: 20,
              ),
              context.sizedBoxHeightSmall,
              RoundButtonWidget(
                onButtonTapped: () {
                  onGuaideTapped();
                },
                btnIconPath: Assets.informationIcon,
                btnIconColor: AppColors.whiteColor,
                btnColor: AppColors.accentColor,
                iconSize: 20,
              ),
              context.sizedBoxHeightSmall,
              RoundButtonWidget(
                onButtonTapped: () {
                  onAddTapped();
                },
                btnIconPath: Assets.addIcon,
                btnIconColor: AppColors.whiteColor,
                btnColor: AppColors.accentColor,
                iconSize: 20,
              ),
            ]),
          ),
          Positioned(
            bottom: 32,
            left: 0,
            child: Lottie.asset(animPath, width: animWidth),
          )
        ],
      ),
    );
  }
}
