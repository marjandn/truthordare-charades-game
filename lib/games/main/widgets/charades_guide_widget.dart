import 'package:flutter/material.dart';

import '../../../core/views/colors.dart';
import '../../../core/views/styles.dart';

class CharadesGuideWidget extends StatelessWidget {
  const CharadesGuideWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius:
            BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
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
                    text: 'بازی فیلم بازی کن! ',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: AppColors.primaryColor)),
                TextSpan(
                    text: 'یک بازی مهیج و شاد برای دورهمی های شماست. \n',
                    style: Theme.of(context).textTheme.bodyMedium),
                TextSpan(
                    text:
                        'در این بازی شما حداقل باید دو گروه باشید که این تعداد میتواند تا ۴ گروه افزایش پیدا کند و هر گروه می تواند بی نهایت اعضا داشته باشد. \n  \n',
                    style: Theme.of(context).textTheme.bodyMedium),
                TextSpan(
                    text: 'این بازی به دو صورت  ', style: Theme.of(context).textTheme.bodyMedium),
                TextSpan(
                    text: 'پانتومیم',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: AppColors.primaryColor)),
                TextSpan(text: ' و یا ', style: Theme.of(context).textTheme.bodyMedium),
                TextSpan(
                    text: 'توصیف کلمه بدون گفتن کلمه اصلی',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: AppColors.primaryColor)),
                TextSpan(
                    text:
                        ' می تواند انجام شود و این شما هستید که خودتان توافق میکنید کدام حالت را انجام دهید. \n \n',
                    style: Theme.of(context).textTheme.bodyMedium),
                TextSpan(
                    text: 'برای شروع بازی در مرحله اول شما ابتدا ',
                    style: Theme.of(context).textTheme.bodyMedium),
                TextSpan(text: 'نام گروه ها', style: Theme.of(context).textTheme.bodyLarge),
                TextSpan(
                    text:
                        ' را وارد میکنید که البته می توانید از نام های پیش فرضی که بازی به شما پیشنهاد می دهد هم استفاده کنید. \n',
                    style: Theme.of(context).textTheme.bodyMedium),
                TextSpan(text: 'در مرحله دوم شما ', style: Theme.of(context).textTheme.bodyMedium),
                TextSpan(text: 'دسته بندی کلمات', style: Theme.of(context).textTheme.bodyLarge),
                TextSpan(
                    text:
                        ' را انتخاب میکنید. دقت کنید که حداقل ۳ دسته بندی را انتخاب کرده باشید. \n',
                    style: Theme.of(context).textTheme.bodyMedium),
                TextSpan(text: 'در مرحله سوم شما ', style: Theme.of(context).textTheme.bodyMedium),
                TextSpan(
                    text: 'تنظیمات بازی و همچنین یک مجازات برای تیم بازنده',
                    style: Theme.of(context).textTheme.bodyLarge),
                TextSpan(
                    text: ' به دلخواه وارد میکنید و در نهایت وارد صفحه اصلی بازی می شوید. \n \n',
                    style: Theme.of(context).textTheme.bodyMedium),
                TextSpan(
                    text:
                        'هر گروه در نوبت خود باید یکی از بازیکنان خود را انتخاب کند که موبایل رو جلو پیشانی خود قرار دهد و بقیه اعضای گروه کلمه نمایش داده شده برروی صفحه موبایل را برای آن بازیکنن فیلم بازی کنند تا بازیکن بتواند کلمه درست را حدس بزند. \n',
                    style: Theme.of(context).textTheme.bodyLarge),
                TextSpan(
                    text:
                        ' پس از حدس درست یا غلط کلمه توسط بازیکن منتخب گروه٬ اعضای گروه برروی دکمه مرتبط ضربه میزنند و کلمه بعدی نمایش داده میشود. \n',
                    style: Theme.of(context).textTheme.bodyLarge),
                TextSpan(
                    text:
                        'هر گروهی که در بازه زمانی خودش بتواند بیشترین کلمه را با موفقیت فیلم بازی کند و پاسخ درست دریافت کند برنده بازی خواهد شد. \n',
                    style: Theme.of(context).textTheme.bodyLarge),
                TextSpan(
                    text:
                        ' در شرایطی که تعداد کلمات درست چند گروه با هم برابر است٬ بازی کلمات نادرست گروه ها را درنظر می گیرد و هر گروه که تعداد کلمات نادرست کمتری داشته باشد برنده بازی خواهد شد. \n \n',
                    style: Theme.of(context).textTheme.bodyLarge),
                TextSpan(
                    text:
                        'بازی شما را در تمام مراحل راهنمایی میکند که در هر مرحله موبایل باید در مقابل پیشانی کدام گروه باشد. \n',
                    style: Theme.of(context).textTheme.bodyMedium),
                TextSpan(
                    text:
                        'شما میتوانید بدون هیچ محدودیتی کلمات و جملات مدنظر خود را بازی اضافه کنید و در بازی های بعدی با انتخاب دسته بندی کلمات من٬ اپلیکیشن کلمات و جملات وارد شده شما را هم در نظر می گیرد.',
                    style: Theme.of(context).textTheme.bodyMedium),
              ]))
            ],
          ),
        ),
      ),
    );
  }
}
