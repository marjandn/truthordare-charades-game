import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:share_plus/share_plus.dart';
import 'package:truth_or_dare/core/views/assets.dart';
import 'package:truth_or_dare/core/views/colors.dart';
import 'package:truth_or_dare/games/truth_or_dare/features/wigets/shared_widgets.dart';

import '../../../../core/global/constants.dart';
import '../../../../core/utility/utility.dart';
import '../../../../core/views/styles.dart';
import '../create_items/dares/create_dare_screen.dart';
import '../../../shared_widgets/round_button_widget.dart';
import '../names/truth_or_dare_names_settings_screen.dart';
import '../create_items/truths/create_truth_screen.dart';

class TruthOrDareDashboardScreen extends StatefulWidget {
  const TruthOrDareDashboardScreen({super.key});

  @override
  TruthOrDareDashboardState createState() => TruthOrDareDashboardState();
}

class TruthOrDareDashboardState extends State<TruthOrDareDashboardScreen> {
  @override
  void initState() {
    super.initState();
    // getUpdateInfo(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          elevation: 0,
          title: Text(
            "جرات و حقیقت",
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
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RoundButtonWidget(
                    onButtonTapped: () => Get.to(() => TruthOrDareNamesSettingsScreen()),
                    btnLabel: "شروع بازی",
                    btnWidget: Lottie.asset(Assets.wheeAnimation, width: 50),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
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
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RoundButtonWidget(
                  onButtonTapped: () {
                    Share.share(
                        "بهترین اپلیکیشن بازی جرات و حقیقت و بازی پانتومیم و ادابازی رو نصب کنید و در دورهمی ها بازی کنید و لذت ببرید \n لینک نصب بازی فاندی \n ${Constants.marketUrl}");
                  },
                  btnIconPath: Assets.shareIcon,
                  iconSize: 20,
                ),
                RoundButtonWidget(
                  onButtonTapped: () {
                    Get.bottomSheet(
                      Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                width: 150,
                                height: 5,
                                margin: const EdgeInsets.symmetric(vertical: 10),
                                decoration: BoxDecoration(
                                    color: AppColors.gray, borderRadius: AppStyles.borderRadius),
                              ),
                            ),
                            const SizedBox(
                              height: 32,
                            ),
                            Text(
                              "وب سایت ما",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Divider(
                              thickness: 1,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              "ورژن بازی",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              "2.0.0",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Divider(
                              thickness: 1,
                            ),
                          ],
                        ),
                      ),
                      backgroundColor: AppColors.whiteColor,
                    );
                  },
                  btnIconPath: Assets.settingsIcon,
                  iconSize: 20,
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
          ],
        ));
  }
}
