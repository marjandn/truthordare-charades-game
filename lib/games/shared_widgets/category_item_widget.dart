import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:truth_or_dare/core/global/defaults.dart';
import 'package:truth_or_dare/core/views/assets.dart';

import '../../core/views/colors.dart';

class CategoryItemWidget extends StatelessWidget {
  final Function onTapp;
  final String title;
  final String imagePath;
  final Color bgColor;
  final bool isSelected;
  const CategoryItemWidget({
    super.key,
    required this.title,
    required this.imagePath,
    required this.onTapp,
    required this.bgColor,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTapp(),
      child: SizedBox(
        height: 130,
        width: 130,
        child: Stack(children: [
          Center(
            child: Container(
              height: 120,
              width: 130,
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: const BorderRadius.all(Radius.circular(20)),
              ),
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(
                  title,
                  style:
                      Theme.of(context).textTheme.titleLarge?.copyWith(color: AppColors.whiteColor),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Image.asset(
              imagePath,
              width: 80,
            ),
          ),
          Positioned(
            top: context.isPhone ? 0 : 9,
            left: context.isPhone ? 15 : 13,
            child: AnimatedOpacity(
              opacity: isSelected ? 1 : 0,
              duration: const Duration(milliseconds: 300),
              child: Image.asset(
                Assets.tickIcon,
                width: 40,
              ),
            ),
          )
        ]),
      ),
    );
  }
}
