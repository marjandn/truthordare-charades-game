import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:truth_or_dare/core/utility/utility.dart';
import 'package:truth_or_dare/core/views/assets.dart';
import 'package:truth_or_dare/core/views/colors.dart';
import 'package:truth_or_dare/games/main/widgets/about_game_popup_widget.dart';
import 'package:truth_or_dare/games/main/widgets/about_us_popup_widget.dart';
import 'package:truth_or_dare/games/main/widgets/charades_guide_widget.dart';
import 'package:truth_or_dare/games/main/widgets/truth_or_dare_guide_widget.dart';

import '../../core/global/constants.dart';
import '../../core/global/defaults.dart';
import '../charades/features/group_settings/charades_group_settings_screen.dart';
import '../charades/features/words/charades_create_word_screen.dart';
import '../shared_widgets/game_scaffold.dart';
import '../truth_or_dare/features/create_items/create_truth_dare_screen.dart';
import '../truth_or_dare/features/names/truth_or_dare_names_settings_screen.dart';
import 'widgets/main_game_item_widget.dart';

class MainDashboardScreen extends StatefulWidget {
  const MainDashboardScreen({super.key});

  @override
  State<MainDashboardScreen> createState() => _MainDashboardScreenState();
}

class _MainDashboardScreenState extends State<MainDashboardScreen> {
  @override
  void initState() {
    super.initState();

    setForcePortrateOritation();
  }

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final ScrollController _scrollController = ScrollController();
  final _advancedDrawerController = AdvancedDrawerController();

  void _handleMenuButtonPressed() {
    _advancedDrawerController.showDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdropColor: AppColors.accentColor,
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: true,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      drawer: Padding(
        padding: const EdgeInsets.only(right: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton.icon(
              onPressed: () {
                Get.bottomSheet(
                  const AboutGamePopupWidget(),
                );
              },
              icon: Image.asset(
                Assets.settingsIcon,
                width: 20,
                color: AppColors.whiteColor,
              ),
              label: Text(
                'درباره بازی',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(color: AppColors.whiteColor),
              ),
            ),
            TextButton.icon(
              onPressed: () {
                Get.bottomSheet(
                  const AboutUsPopupWidget(),
                );
              },
              icon: Image.asset(
                Assets.settingsIcon,
                width: 20,
                color: AppColors.whiteColor,
              ),
              label: Text(
                'درباره ما',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(color: AppColors.whiteColor),
              ),
            ),
            TextButton.icon(
              onPressed: () {
                Share.share(
                    "بهترین اپلیکیشن بازی جرات و پانتومیم و ادابازی حقیقت رو نصب کنید و در فاندی ها بازی کنید و لذت ببرید \n لینک نصب بازی فاندی \n ${Constants.marketUrl}");
              },
              icon: Image.asset(
                Assets.shareIcon,
                width: 20,
                color: AppColors.whiteColor,
              ),
              label: Text(
                'اشتراک گذاری',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(color: AppColors.whiteColor),
              ),
            ),
          ],
        ),
      ),
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: true,
          elevation: 0,
          leading: IconButton(
            onPressed: _handleMenuButtonPressed,
            icon: ValueListenableBuilder<AdvancedDrawerValue>(
              valueListenable: _advancedDrawerController,
              builder: (_, value, __) {
                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 250),
                  child: Icon(
                    value.visible ? Icons.clear : Icons.menu,
                    key: ValueKey<bool>(value.visible),
                  ),
                );
              },
            ),
          ),
        ),
        body: GameScaffold(
          body: Stack(
            children: [
              ListView(
                controller: _scrollController,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: SizedBox(
                      width: 500,
                      child: MainGameItemWidget(
                        title: 'جرات حقیقت',
                        animPath: Assets.wheeAnimation,
                        animWidth: 220,
                        onPlayTapped: () {
                          Get.to(
                            () => TruthOrDareNamesSettingsScreen(),
                            transition: Transition.size,
                            duration: Defaults.defaultAnimDuration,
                          );
                        },
                        onAddTapped: () {
                          Get.to(
                            () => const CreateTruthDareScreen(),
                            transition: Transition.size,
                            duration: Defaults.defaultAnimDuration,
                          );
                        },
                        onGuaideTapped: () {
                          Get.bottomSheet(
                            const TruthOrDareGuideWidget(),
                          );
                        },
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      width: 500,
                      child: MainGameItemWidget(
                        title: 'فیلم بازی کن!',
                        animPath: Assets.pantumimeAnimation,
                        animWidth: 300,
                        onPlayTapped: () {
                          Get.to(
                            () => CharadesGroupSettingsScreen(),
                            transition: Transition.size,
                            duration: Defaults.defaultAnimDuration,
                          );
                        },
                        onAddTapped: () {
                          Get.to(
                            () => CharadesCreateWordScreen(),
                            transition: Transition.size,
                            duration: Defaults.defaultAnimDuration,
                          );
                        },
                        onGuaideTapped: () {
                          Get.bottomSheet(
                            const CharadesGuideWidget(),
                          );
                        },
                      ),
                    ),
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
