import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:truth_or_dare/core/extensions/context_extensions.dart';
import 'package:truth_or_dare/core/utility/utility.dart';
import 'package:truth_or_dare/core/views/assets.dart';
import 'package:truth_or_dare/core/views/colors.dart';
import '../../../../../core/global/defaults.dart';
import '../charades_game_screen.dart';
import '../widgets/charades_game_info_widget.dart';

class PreCharadesScreen extends StatefulWidget {
  const PreCharadesScreen({super.key});

  @override
  State<PreCharadesScreen> createState() => _PreCharadesScreenState();
}

class _PreCharadesScreenState extends State<PreCharadesScreen> {
  @override
  void initState() {
    super.initState();
    setForceLandscapeOritation();
  }

  @override
  dispose() {
    setForcePortrateOritation();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CharadesGameInfoWidget(showPauseButton: false),
          Expanded(
              child: GestureDetector(
            onTap: () => Get.to(
              () => const CharadesGameScreen(),
              transition: Transition.size,
              duration: Defaults.defaultAnimDuration,
            ),
            child: Column(
              children: [
                context.sizedBoxHeightSmall,
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      "موبایل را روی پیشانی خود بگذارید \n و برروی صفحه ضربه بزنید",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.whiteColor,
                          ),
                    ),
                  ),
                ),
                Lottie.asset(Assets.tapAnimation, width: 110),
              ],
            ),
          ))
        ],
      ),
    ));
  }
}
