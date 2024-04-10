import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:truth_or_dare/core/extensions/context_extensions.dart';
import 'package:truth_or_dare/core/views/colors.dart';

import '../../../../../core/global/defaults.dart';
import '../../../../shared_widgets/utils/switching_anim_utils.dart';
import '../charades_group_settings_controller.dart';

class GroupCountWidget extends StatelessWidget {
  GroupCountWidget({super.key});
  final CharadesGroupSettingsController _controller = Get.find<CharadesGroupSettingsController>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Obx(() => AnimatedPositioned(
              left: SwitchingAnimUtils.getLeftSpaceTopTabBar(
                  tabWidth: Get.width,
                  currentPos: _controller.groupCounts.indexOf(_controller.selectedGroupCount.value),
                  tabItemsCount: 3),
              duration: Defaults.defaultAnimDuration,
              curve: Curves.bounceOut,
              child: Container(
                height: 50,
                width: SwitchingAnimUtils.getTopTabBarSelectedBoxWidth(
                    tabItemsCount: 3, tabWidth: Get.width),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Theme.of(context).colorScheme.primary),
                  boxShadow: context.appDefaultShadow(),
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            )),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: InkWell(
                onTap: () => _controller.changeGroupCount(2),
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Theme.of(context).colorScheme.primary),
                  ),
                  child: Center(
                      child: Obx(
                    () => Text(
                      _controller.getGroupCountText(2),
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: _controller.isPosSelected(2)
                                ? AppColors.whiteColor
                                : AppColors.accentColor,
                          ),
                    ),
                  )),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () => _controller.changeGroupCount(1),
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Theme.of(context).colorScheme.primary),
                  ),
                  child: Center(
                      child: Obx(
                    () => Text(
                      _controller.getGroupCountText(1),
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: _controller.isPosSelected(1)
                                ? AppColors.whiteColor
                                : AppColors.accentColor,
                          ),
                    ),
                  )),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () => _controller.changeGroupCount(0),
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Theme.of(context).colorScheme.primary),
                  ),
                  child: Center(
                      child: Obx(
                    () => Text(
                      _controller.getGroupCountText(0),
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: _controller.isPosSelected(0)
                                ? AppColors.whiteColor
                                : AppColors.accentColor,
                          ),
                    ),
                  )),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
