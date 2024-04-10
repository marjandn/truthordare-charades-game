import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:truth_or_dare/core/extensions/context_extensions.dart';
import 'package:truth_or_dare/core/global/defaults.dart';
import 'package:truth_or_dare/core/views/assets.dart';
import 'package:truth_or_dare/core/views/colors.dart';
import 'package:truth_or_dare/games/charades/features/group_settings/charades_group_settings_controller.dart';
import 'package:truth_or_dare/games/main/main_dashboard_screen.dart';
import 'package:truth_or_dare/games/shared_widgets/round_button_widget.dart';

import '../../../shared_widgets/game_scaffold.dart';
import '../game_categories_settings/charades_categories_screen.dart';
import 'widgets/group_count_widget.dart';
import 'widgets/group_item_widget.dart';

class CharadesGroupSettingsScreen extends StatelessWidget {
  CharadesGroupSettingsScreen({super.key});

  final CharadesGroupSettingsController _controller = Get.find<CharadesGroupSettingsController>();

  late final TextEditingController _group1TextController = TextEditingController(text: _controller.group1);
  late final TextEditingController _group2TextController = TextEditingController(text: _controller.group2);
  late final TextEditingController _group3TextController = TextEditingController(text: _controller.group3);
  late final TextEditingController _group4TextController = TextEditingController(text: _controller.group4);

  @override
  Widget build(BuildContext context) {
    bool keyboardIsOpen = MediaQuery.of(context).viewInsets.bottom != 0;

    return GameScaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 60),
        padding: const EdgeInsets.only(
          top: 24,
        ),
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
                  width: 28,
                ),
                onPressed: () => Get.offAll(() => MainDashboardScreen()),
              )),
          Align(
            alignment: Alignment.topCenter,
            child: Text(
              'نام گروه ها را وارد کنید.',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          context.sizedBoxHeightMicro,
          Text(
            'میتوانید از نام های پیشفرض گروه استفاده کنید.',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          context.sizedBoxHeightSmall,
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Obx(() => Column(
                      children: [
                        GroupItemWidget(
                          group1TextController: _group1TextController,
                          assetPath: _controller.groupIcons.first,
                        ),
                        context.sizedBoxHeightExtraSmall,
                        GroupItemWidget(
                          group1TextController: _group2TextController,
                          assetPath: _controller.groupIcons[1],
                        ),
                        context.sizedBoxHeightExtraSmall,
                        Visibility(
                          visible: _controller.selectedGroupCount >= 3,
                          child: GroupItemWidget(
                            group1TextController: _group3TextController,
                            assetPath: _controller.groupIcons[2],
                          ),
                        ),
                        context.sizedBoxHeightExtraSmall,
                        Visibility(
                          visible: _controller.selectedGroupCount >= 4,
                          child: GroupItemWidget(
                            group1TextController: _group4TextController,
                            assetPath: _controller.groupIcons[3],
                          ),
                        ),
                      ],
                    )),
              ),
            ),
          ),
          context.sizedBoxHeightDefault,
          Visibility(
            visible: !keyboardIsOpen,
            child: Column(
              children: [
                GroupCountWidget(),
                context.sizedBoxHeightDefault,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: RoundButtonWidget(
                      onButtonTapped: () {
                        bool result = _controller.saveGroupsData(
                            _group1TextController.text.trim(),
                            _group2TextController.text.trim(),
                            _group3TextController.text.trim(),
                            _group4TextController.text.trim());
                        if (result) {
                          Get.to(
                            () => CharadesCategoriesScreen(),
                            transition: Transition.size,
                            duration: Defaults.defaultAnimDuration,
                          );
                        } else {
                          context.showSnackBar(msg: "لطفا نام تمامی گروه ها را وارد کنید");
                        }
                      },
                      btnColor: Theme.of(context).colorScheme.secondary,
                      btnWidget: Lottie.asset(
                        Assets.whiteArrowJson,
                        width: 50,
                      ),
                    ),
                  ),
                ),
                context.sizedBoxHeightExtraSmall,
                // Ads widget
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
