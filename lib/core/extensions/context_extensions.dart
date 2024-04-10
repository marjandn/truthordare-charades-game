import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../views/colors.dart';

extension ContextExtension on BuildContext {
  double dynamicHeight(double value) => MediaQuery.of(this).size.height * value;

  double dynamicWidth(double value) => MediaQuery.of(this).size.width * value;

  ThemeData get theme => Theme.of(this);
}

extension EmptyWidget on BuildContext {
  Widget get sizedBoxHeightMicro => SizedBox(
        height: dynamicHeight(0.005),
      );

  Widget get sizedBoxHeightUltraSmall => SizedBox(
        height: dynamicHeight(0.01),
      );

  Widget get sizedBoxHeightExtraSmall => SizedBox(
        height: dynamicHeight(0.02),
      );

  Widget get sizedBoxHeightSmall => SizedBox(
        height: dynamicHeight(0.04),
      );

  Widget get sizedBoxHeightDefault => SizedBox(
        height: dynamicHeight(0.06),
      );

  Widget get sizedBoxHeightLarge => SizedBox(
        height: dynamicHeight(0.08),
      );

  Widget get sizedBoxHeightExtraLarge => SizedBox(
        height: dynamicHeight(0.1),
      );

  Widget get sizedBoxWidthExtraSmall => SizedBox(
        width: dynamicWidth(0.02),
      );

  Widget get sizedBoxWidthMicro => SizedBox(
        width: dynamicWidth(0.01),
      );

  Widget get sizedBoxWidthSmall => SizedBox(
        width: dynamicWidth(0.04),
      );

  Widget get sizedBoxWidthDefault => SizedBox(
        width: dynamicWidth(0.06),
      );

  Widget get sizedBoxWidthLarge => SizedBox(
        width: dynamicWidth(0.08),
      );

  Widget get sizedBoxWidthExtraLarge => SizedBox(
        width: dynamicWidth(0.1),
      );
}

extension Snackbar on BuildContext {
  showSnackBar({
    String msg = "خطایی در اتصال به سرور پیش آمده، لطفا مجددا تلاش کنید",
  }) {
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(
      content: Text(msg,
          style: Theme.of(this).textTheme.bodyMedium?.copyWith(color: AppColors.whiteColor)),
    ));
  }
}

extension MiniWidgets on BuildContext {
  AppBar simpleAppbar({String title = ''}) => AppBar(
        backgroundColor: Theme.of(this).colorScheme.primary,
        elevation: 0,
        title: Text(title,
            style: Theme.of(this).textTheme.titleLarge?.copyWith(color: AppColors.whiteColor)),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.back(),
              icon: Icon(Icons.arrow_forward_ios_rounded, color: AppColors.whiteColor)),
        ],
      );
}

extension WidgetSyles on BuildContext {
  List<BoxShadow> appDefaultShadow({Color? shadowColor}) => [
        BoxShadow(
          color: shadowColor ?? AppColors.transparentBlackColor,
          spreadRadius: 1,
          blurRadius: 5,
        )
      ];
}
