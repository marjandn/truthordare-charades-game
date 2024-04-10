import 'package:flutter/material.dart';
import 'package:truth_or_dare/core/global/constants.dart';
import 'package:truth_or_dare/core/views/assets.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/views/colors.dart';
import '../../../shared_widgets/round_button_widget.dart';

showUpdateDialog({
  required BuildContext context,
  required String text,
}) {
  showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.only(left: 16, top: 32, right: 16, bottom: 32),
            margin: const EdgeInsets.only(top: 50),
            decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  Assets.infoIcon,
                  width: 60,
                ),
                const SizedBox(
                  height: 32,
                ),
                Text(
                  text,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 32,
                ),
                RoundButtonWidget(
                  onButtonTapped: () {
                    launchUrl(Uri.parse(Constants.marketUrl), mode: LaunchMode.externalApplication);
                  },
                  btnLabel: "دانلود نسخه جدید",
                  btnColor: Theme.of(context).colorScheme.primary,
                  labelColor: AppColors.whiteColor,
                ),
              ],
            ),
          ),
        );
      });
}
