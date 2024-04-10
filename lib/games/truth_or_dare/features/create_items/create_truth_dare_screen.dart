import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:truth_or_dare/games/truth_or_dare/features/create_items/truths/create_truth_screen.dart';

import '../../../../core/views/assets.dart';
import '../../../../core/views/colors.dart';
import '../../../shared_widgets/game_scaffold.dart';
import '../../../shared_widgets/round_button_widget.dart';
import 'dares/create_dare_screen.dart';

class CreateTruthDareScreen extends StatelessWidget {
  const CreateTruthDareScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GameScaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          elevation: 0,
          title: Text(
            "",
            style: Theme.of(context)
                .textTheme
                .headlineMedium
                ?.copyWith(fontWeight: FontWeight.bold, color: AppColors.whiteColor),
          ),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RoundButtonWidget(
                    onButtonTapped: () => Get.to(() => CreateTruthScreen()),
                    btnIconPath: Assets.addIcon,
                    iconSize: 20,
                    btnLabel: "ایجاد حقیقت",
                    btnColor: Theme.of(context).colorScheme.secondary,
                    labelColor: AppColors.whiteColor,
                    btnIconColor: AppColors.whiteColor,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  RoundButtonWidget(
                    onButtonTapped: () => Get.to(() => CreateDareScreen()),
                    btnIconPath: Assets.addIcon,
                    iconSize: 20,
                    btnLabel: "ایجاد جرات",
                    btnColor: Theme.of(context).colorScheme.secondary,
                    labelColor: AppColors.whiteColor,
                    btnIconColor: AppColors.whiteColor,
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
