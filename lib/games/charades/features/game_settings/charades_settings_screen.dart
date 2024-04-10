import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:truth_or_dare/core/extensions/context_extensions.dart';
import 'package:truth_or_dare/games/shared_widgets/roung_text_input_widget.dart';

import '../../../../core/global/defaults.dart';
import '../../../../core/views/assets.dart';
import '../../../../core/views/colors.dart';
import '../../../main/main_dashboard_screen.dart';
import '../../../shared_widgets/game_scaffold.dart';
import '../../../shared_widgets/round_button_widget.dart';

import '../game/pre_game/pre_charades_screen.dart';
import 'charades_settings_controller.dart';
import 'data/entity/game_settings.dart';
import 'widgets/stepper_settings_widget.dart';

class CharadesSettingsScreen extends StatelessWidget {
  CharadesSettingsScreen({super.key});

  final CharadesSettingsController _controller = Get.find<CharadesSettingsController>();

  final TextEditingController _punishTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool keyboardIsOpen = MediaQuery.of(context).viewInsets.bottom != 0;

    return GameScaffold(
      body: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 60),
            padding: const EdgeInsets.only(top: 24, right: 20, left: 20),
            height: Get.height,
            decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(-1, -1),
                    color: AppColors.transparentBlackColor,
                    blurRadius: 20,
                  )
                ]),
            child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
              Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: Image.asset(
                      Assets.deleteIcon,
                      width: 20,
                    ),
                    onPressed: () => Get.offAll(() => MainDashboardScreen()),
                  )),
              Align(
                alignment: Alignment.topCenter,
                child: Text(
                  'تنظیمات بازی را انتخاب کنید.',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              context.sizedBoxHeightDefault,
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          context.sizedBoxWidthMicro,
                          Expanded(
                            child: Text(
                              'تعداد دور',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ),
                          StepperSettingsWidget(
                            items: _controller.roundItems,
                            changeSelectedItem: (GameSettings selectedItem) {
                              _controller.selectedRoundItem = selectedItem;
                            },
                          ),
                          context.sizedBoxWidthMicro,
                        ],
                      ),
                      context.sizedBoxHeightSmall,
                      Row(
                        children: [
                          context.sizedBoxWidthMicro,
                          Expanded(
                            child: Text(
                              'زمان تایمر',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ),
                          StepperSettingsWidget(
                            items: _controller.timerItems,
                            changeSelectedItem: (GameSettings selectedItem) {
                              _controller.selectedTimerDuration = selectedItem;
                            },
                          ),
                          context.sizedBoxWidthMicro,
                        ],
                      ),
                      context.sizedBoxHeightSmall,
                      Row(
                        children: [
                          context.sizedBoxWidthMicro,
                          Expanded(
                            child: Text(
                              'سختی بازی',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ),
                          StepperSettingsWidget(
                            items: _controller.difficultlyItems,
                            changeSelectedItem: (GameSettings selectedItem) {
                              _controller.selectedDifficultlyItem = selectedItem;
                            },
                          ),
                          context.sizedBoxWidthMicro,
                        ],
                      ),
                      context.sizedBoxHeightDefault,
                      Row(
                        children: [
                          context.sizedBoxWidthMicro,
                          Lottie.asset(Assets.fireAnimation, height: 50),
                          Text(
                            'مجازات تیم بازنده',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          context.sizedBoxWidthMicro,
                        ],
                      ),
                      context.sizedBoxHeightMicro,
                      RoundedTextInputWidget(
                        textEditController: _punishTextController,
                        hintText: 'مجازات تیم بازنده را بنویسید...',
                        textPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                        textStyle: Theme.of(context).textTheme.bodyMedium,
                        keyboardType: TextInputType.multiline,
                        minLines: 4,
                        maxLines: 4,
                      ),
                    ],
                  ),
                ),
              ),
              context.sizedBoxHeightLarge,
              Visibility(
                visible: !keyboardIsOpen,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RoundButtonWidget(
                          onButtonTapped: () {
                            _controller.punishText = _punishTextController.text.trim();
                            Get.to(
                              () => PreCharadesScreen(),
                              transition: Transition.size,
                              duration: Defaults.defaultAnimDuration,
                            );
                          },
                          btnColor: Theme.of(context).colorScheme.secondary,
                          btnWidget: Lottie.asset(
                            Assets.whiteArrowJson,
                            width: 50,
                          ),
                        ),
                        Transform.rotate(
                          angle: -pi,
                          child: IconButton(
                              onPressed: () => Get.back(),
                              icon: Icon(
                                Icons.arrow_back_rounded,
                                color: Theme.of(context).colorScheme.secondary,
                              )),
                        ),
                      ],
                    ),
                    context.sizedBoxHeightExtraSmall,
                    // Ads widget
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
