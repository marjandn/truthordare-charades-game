import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:truth_or_dare/core/extensions/context_extensions.dart';
import 'package:truth_or_dare/core/global/constants.dart';
import 'package:truth_or_dare/games/main/main_dashboard_screen.dart';

import '../../../../../core/utility/utility.dart';
import '../../../../../core/views/assets.dart';
import '../../../../../core/views/colors.dart';
import '../../../../shared_widgets/round_button_widget.dart';

class CharadesGameWinMenuWidget extends StatelessWidget {
  const CharadesGameWinMenuWidget({
    super.key,
    required this.winnerGroupName,
    required this.punish,
    required this.onRedoClick,
  });

  final String winnerGroupName;
  final String punish;
  final Function onRedoClick;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        height: Get.height,
        margin: const EdgeInsets.all(30),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(50),
            ),
            boxShadow: context.appDefaultShadow()),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              context.sizedBoxHeightSmall,
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  context.sizedBoxWidthSmall,
                  Expanded(
                      child: Column(
                    children: [
                      SizedBox(
                        height: 120,
                        child: OverflowBox(
                          minHeight: 170,
                          maxHeight: 170,
                          child: Lottie.asset(Assets.cupAnimation),
                        ),
                      ),
                      context.sizedBoxHeightSmall,
                      Text(
                        'برندگان بازی:',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        winnerGroupName,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                  )),
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Lottie.asset(Assets.fireAnimation, height: context.isPhone ? 50 : 100),
                          Text(
                            'مجازات تیم بازنده:',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                      context.sizedBoxHeightMicro,
                      Text(
                        punish,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  )),
                ],
              ),
              context.sizedBoxHeightExtraLarge,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RoundButtonWidget(
                    onButtonTapped: () {
                      Get.back();
                      setForcePortrateOritation();
                      Get.offAll(() => const MainDashboardScreen());
                    },
                    btnIconPath: Assets.homeIcon,
                    btnPadding: const EdgeInsets.all(7),
                    iconSize: 17,
                    btnIconColor: AppColors.whiteColor,
                    btnColor: Theme.of(context).colorScheme.secondary,
                  ),
                  context.sizedBoxWidthSmall,
                  RoundButtonWidget(
                    onButtonTapped: () {
                      Get.back();
                      onRedoClick();
                    },
                    btnIconPath: Assets.retryIcon,
                    btnPadding: const EdgeInsets.all(3),
                    iconSize: 25,
                    btnIconColor: AppColors.whiteColor,
                    btnColor: Theme.of(context).colorScheme.secondary,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
