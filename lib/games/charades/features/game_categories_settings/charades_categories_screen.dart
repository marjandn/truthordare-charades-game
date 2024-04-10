import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:truth_or_dare/core/extensions/context_extensions.dart';
import 'package:truth_or_dare/games/charades/features/game_settings/charades_settings_screen.dart';

import '../../../../core/global/defaults.dart';
import '../../../../core/views/assets.dart';
import '../../../../core/views/colors.dart';
import '../../../main/main_dashboard_screen.dart';
import '../../../shared_widgets/game_scaffold.dart';
import '../../../shared_widgets/category_item_widget.dart';
import '../../../shared_widgets/round_button_widget.dart';
import 'charades_categories_controller.dart';

class CharadesCategoriesScreen extends StatelessWidget {
  CharadesCategoriesScreen({super.key});

  final CharadesCategoriesController _controller = Get.find<CharadesCategoriesController>();

  @override
  Widget build(BuildContext context) {
    return GameScaffold(
      body: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(
              top: 60,
            ),
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
                    onPressed: () => Get.offAll(() => const MainDashboardScreen()),
                  )),
              Align(
                alignment: Alignment.topCenter,
                child: Text(
                  'دسته بندی کلمات را انتخاب کنید.',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Obx(
                        () => GridView.count(
                            crossAxisCount: context.isPhone ? 2 : 4,
                            childAspectRatio: 1.2,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            children: _controller.categories
                                .map(
                                  (e) => CategoryItemWidget(
                                    title: e.categoryName,
                                    imagePath: e.iconPath,
                                    bgColor: e.itemColor,
                                    onTapp: () => _controller.changeCategorySelection(e.categoryId),
                                    isSelected: _controller.selectedCategories.contains(e.categoryId),
                                  ),
                                )
                                .toList()),
                      ),
                      context.sizedBoxHeightExtraLarge,
                      context.sizedBoxHeightExtraLarge,
                    ],
                  ),
                ),
              ),
            ]),
          ),
          Positioned(
            bottom: 0,
            right: 20,
            left: 20,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RoundButtonWidget(
                      onButtonTapped: () => _controller.selectedCategories.length >= 3
                          ? Get.to(
                              () => CharadesSettingsScreen(),
                              transition: Transition.size,
                              duration: Defaults.defaultAnimDuration,
                            )
                          : {context.showSnackBar(msg: "لطفا حداقل ۳ دسته بندی انتخاب کنید.")},
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
          )
        ],
      ),
    );
  }
}
