import 'package:flutter/material.dart';
import 'package:truth_or_dare/core/extensions/context_extensions.dart';
import 'package:truth_or_dare/core/views/colors.dart';

import '../../core/views/styles.dart';

class RoundButtonWidget extends StatelessWidget {
  final Function onButtonTapped;
  final String btnIconPath;
  final double iconSize;
  final String btnLabel;
  final TextStyle? labelStyle;
  final Color labelColor;
  final Color btnColor;
  final EdgeInsetsGeometry btnPadding;
  final Widget btnWidget;
  final Color btnIconColor;

  RoundButtonWidget({
    super.key,
    required this.onButtonTapped,
    this.btnPadding = const EdgeInsets.all(12),
    Widget? btnWidget,
    this.btnIconPath = '',
    this.btnLabel = '',
    this.iconSize = 0,
    this.labelStyle,
    Color? btnColor,
    Color? labelColor,
    Color? btnIconColor,
  })  : btnColor = btnColor ?? AppColors.whiteColor,
        labelColor = labelColor ?? AppColors.accentColor,
        btnIconColor = btnIconColor ?? AppColors.accentColor,
        btnWidget = btnWidget ?? const SizedBox();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: AppStyles.borderRadius,
      onTap: () => onButtonTapped(),
      child: Container(
        padding: btnPadding,
        decoration: BoxDecoration(
          boxShadow: context.appDefaultShadow(),
          color: btnColor,
          borderRadius: const BorderRadius.all(Radius.circular(15)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Visibility(visible: btnWidget is! SizedBox, child: btnWidget),
            Visibility(
              visible: btnIconPath.isNotEmpty,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                child: Image.asset(
                  btnIconPath,
                  color: btnIconColor,
                  width: iconSize,
                ),
              ),
            ),
            Visibility(
              visible: btnLabel.isNotEmpty,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Text(
                  btnLabel,
                  style: labelStyle ??
                      Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: labelColor,
                          ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
