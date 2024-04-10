import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/views/colors.dart';
import '../../../core/views/styles.dart';

class AboutUsPopupWidget extends StatelessWidget {
  const AboutUsPopupWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 150,
              height: 5,
              margin: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(color: AppColors.gray, borderRadius: AppStyles.borderRadius),
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          RichText(
              text: TextSpan(children: [
            TextSpan(text: 'ما ', style: Theme.of(context).textTheme.bodyMedium),
            TextSpan(
                text: 'تیم برنامه نویسی پروگران',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: AppColors.primaryColor)),
            TextSpan(
                text: ' هستیم فعال در زمینه طراحی اپلیکیشن موبایل و طراحی وب سایت با بهترین کیفیت. \n \n',
                style: Theme.of(context).textTheme.bodyMedium),
            TextSpan(text: 'أدرس ایمیل ما: \n', style: Theme.of(context).textTheme.bodyMedium),
            TextSpan(
                text: 'progrun.games@gmail.com \n \n',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: AppColors.primaryColor)),
            TextSpan(text: 'وب سایت ما: \n', style: Theme.of(context).textTheme.bodyMedium),
            TextSpan(
                text: 'progrun.ir',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: AppColors.primaryColor),
                recognizer: TapGestureRecognizer()
                  ..onTap = () async {
                    await launchUrl(Uri.parse('https://progrun.ir'), mode: LaunchMode.externalApplication);
                  }),
          ]))
        ],
      ),
    );
  }
}
