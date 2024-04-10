import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:truth_or_dare/core/extensions/context_extensions.dart';
import 'package:truth_or_dare/core/views/styles.dart';

import '../../../../../core/views/assets.dart';
import '../../../../../core/views/colors.dart';

class TruthFrontCartWidget extends StatelessWidget {
  const TruthFrontCartWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: context.appDefaultShadow(),
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: AppStyles.borderRadius,
          border: Border.all(color: AppColors.whiteColor, width: 3),
          image: const DecorationImage(image: AssetImage(Assets.patternImage), fit: BoxFit.cover)),
      child: Stack(children: [
        Align(
          alignment: Alignment.center,
          child: Image.asset(
            Assets.truthImage,
            color: AppColors.whiteColor,
            width: 150,
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 10, bottom: 4),
            child: Text(
              "حقیقت",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: AppColors.whiteColor, fontWeight: FontWeight.bold),
            ),
          ),
        )
      ]),
    );
  }
}

class TruthRareCartWidget extends StatelessWidget {
  final String questionText;
  final Function onBackClick;
  const TruthRareCartWidget({super.key, required this.questionText, required this.onBackClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        boxShadow: context.appDefaultShadow(shadowColor: Theme.of(context).colorScheme.secondary),
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: AppStyles.borderRadius,
      ),
      child: Column(children: [
        const SizedBox(
          height: 20,
        ),
        Image.asset(
          Assets.truthImage,
          color: AppColors.whiteColor,
          width: 100,
        ),
        const SizedBox(
          height: 8,
        ),
        Expanded(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: Text(
              questionText,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: AppColors.whiteColor, fontWeight: FontWeight.bold),
            ))
          ],
        )),
        Padding(
          padding: const EdgeInsets.only(right: 10, bottom: 4),
          child: Row(
            children: [
              GestureDetector(
                onTap: () => onBackClick(),
                child: Lottie.asset(
                  Assets.whiteArrowJson,
                  width: 50,
                ),
              ),
              Expanded(
                child: Text(
                  "حقیقت",
                  textAlign: TextAlign.left,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(color: AppColors.whiteColor, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
