import 'package:flutter/material.dart';

import '../../../core/views/colors.dart';
import '../../../core/views/styles.dart';

class AboutGamePopupWidget extends StatelessWidget {
  const AboutGamePopupWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius:
            BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
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
              decoration:
                  BoxDecoration(color: AppColors.gray, borderRadius: AppStyles.borderRadius),
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          RichText(
              text: TextSpan(children: [
            TextSpan(
                text: 'اپلیکیشن فاندی',
                style:
                    Theme.of(context).textTheme.bodyLarge?.copyWith(color: AppColors.primaryColor)),
            TextSpan(
                text:
                    ' یک مجموعه از بازی های است که میتوانید در جمع خانواده و دوستان بازی کنید و لذت ببرید. \n',
                style: Theme.of(context).textTheme.bodyMedium),
            TextSpan(
                text: 'اپلیکیشن فاندی',
                style:
                    Theme.of(context).textTheme.bodyLarge?.copyWith(color: AppColors.primaryColor)),
            TextSpan(
                text:
                    ' درحال تکمیل شدن است و ما در تلاشیم مجموعه بازی ها را برای شما عزیزان به طور مداوم تکمیل کنیم که تا در نهايت شما تنها با نصب یک اپلیکیشن چندین بازی جذاب برای دورهمی های خود داشته باشید و لذت ببرید. \n',
                style: Theme.of(context).textTheme.bodyMedium),
            TextSpan(
                text:
                    'اپلیکیشن فاندی را به دوستان خود معرفی کنید و با ما بمانید. خبر های جذابی در راه است. \n \n',
                style:
                    Theme.of(context).textTheme.bodyLarge?.copyWith(color: AppColors.primaryColor)),
            TextSpan(text: 'ورژن بازی:  ', style: Theme.of(context).textTheme.bodyMedium),
            TextSpan(text: '2.0.0', style: Theme.of(context).textTheme.bodyLarge),
          ]))
        ],
      ),
    );
  }
}
