import 'package:flutter/material.dart';

import '../../../core/views/colors.dart';
import '../../../core/views/styles.dart';

class TruthOrDareGuideWidget extends StatelessWidget {
  const TruthOrDareGuideWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
      ),
      child: Scrollbar(
        thumbVisibility: true,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
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
                TextSpan(
                    text: 'بازی جرات حقیقت ',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: AppColors.primaryColor)),
                TextSpan(
                    text:
                        'یک بازی جذاب و شاد برای دورهمی های شماست. البته شما میتوانید با حداقل دو نفر این بازی رو انجام دهید و لذت ببرید. \n',
                    style: Theme.of(context).textTheme.bodyMedium),
                TextSpan(
                    text:
                        'برای شروع بازی شما ابتدا باید نام بازیکنان را وارد کنید و بدون نگرانی میتوانید هر تعداد بازیکن که مدنظر دارید را در صفحه نام بازیکنان وارد کنید. \n \n',
                    style: Theme.of(context).textTheme.bodyMedium),
                TextSpan(
                    text:
                        'سپس وارد صفحه اصلی بازی جرات حقیقت می شوید٬ در این صفحه برای شروع بازی یکی از بازیکنان برروی دکمه گردونه کلیک میکند یا خود گردونه رو میچرخاند و یکی از بازیکنان به صورت تصادفی توسط  اپلیکیشن انتخاب میشود٬ سپس وارد صفحه انتخاب کارت میشوید.  \n',
                    style: Theme.of(context).textTheme.bodyLarge),
                TextSpan(text: 'بازی به بازیکن انتخاب شده ۴ کارت پیشنهاد میدهد که شامل ۲ کارت جرات و ۲ کارت حقیقت می باشد٬ در این حالت بازیکن ۴ انتخاب مختلف دارد و میتواند یکی از کارت ها را انتخاب کند. \n \n', style: Theme.of(context).textTheme.bodyLarge),
                TextSpan(
                    text:
                        'شما میتوانید بدون هیچ محدودیتی کلمات مدنظر خود را در قالب جرات یا حقیقا به بازی اضافه کنید تا در بازی های بعدی اپلیکیشن کلمات وارد شده شما را هم در نظر بگیرد.',
                    style: Theme.of(context).textTheme.bodyMedium),

              ]))
            ],
          ),
        ),
      ),
    );
  }
}
