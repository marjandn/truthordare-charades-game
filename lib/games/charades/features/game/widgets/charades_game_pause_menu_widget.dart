import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:truth_or_dare/core/extensions/context_extensions.dart';
import 'package:truth_or_dare/games/main/main_dashboard_screen.dart';

import '../../../../../core/views/assets.dart';
import '../../../../../core/views/colors.dart';
import '../../../../shared_widgets/round_button_widget.dart';

class CharadesGamePauseMenuWidget extends StatelessWidget {
  const CharadesGamePauseMenuWidget({
    super.key,
    required this.onResumeClick,
    required this.onRedoClick,
    required this.lastWords,
  });
  final Function onRedoClick;
  final Function onResumeClick;
  final List<String> lastWords;

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  icon: Image.asset(
                    Assets.deleteIcon,
                    width: 20,
                  ),
                  onPressed: () {
                    Get.back();

                    onResumeClick();
                  },
                ),
                context.sizedBoxWidthDefault,
                Text(
                  'کلمه های قبلی',
                  style: Theme.of(context).textTheme.titleMedium,
                )
              ],
            ),
            context.sizedBoxHeightExtraSmall,
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: lastWords.isNotEmpty
                    ? BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        border: Border.all(
                          color: Theme.of(context).colorScheme.primary,
                        ))
                    : null,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Wrap(
                    children: lastWords.map((e) => CharadesLastWordItemWidget(text: e)).toList(),
                  ),
                ),
              ),
            ),
            context.sizedBoxHeightDefault,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RoundButtonWidget(
                  onButtonTapped: () {
                    Get.offAll(const MainDashboardScreen());
                  },
                  btnIconPath: Assets.homeIcon,
                  btnPadding: const EdgeInsets.all(7),
                  iconSize: 17,
                  btnIconColor: AppColors.whiteColor,
                  btnColor: Theme.of(context).colorScheme.secondary,
                ),
                context.sizedBoxWidthDefault,
                RoundButtonWidget(
                  onButtonTapped: () {
                    Get.back();
                    onResumeClick();
                  },
                  btnIconPath: Assets.playIcon,
                  btnPadding: const EdgeInsets.all(7),
                  iconSize: 17,
                  btnIconColor: AppColors.whiteColor,
                  btnColor: Theme.of(context).colorScheme.secondary,
                ),
                context.sizedBoxWidthDefault,
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
            context.sizedBoxHeightSmall,
          ],
        ),
      ),
    );
  }
}

class CharadesLastWordItemWidget extends StatelessWidget {
  final String text;
  final Color? textColor;
  const CharadesLastWordItemWidget({
    super.key,
    required this.text,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: textColor),
      ),
    );
  }
}
