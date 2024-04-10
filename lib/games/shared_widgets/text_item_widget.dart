import 'package:flutter/material.dart';

import '../../core/views/assets.dart';
import '../../core/views/colors.dart';

class TextItemWidget extends StatelessWidget {
  final String text;
  final Function onDeleteItemClick;
  const TextItemWidget({super.key, required this.text, required this.onDeleteItemClick});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 5, bottom: 5, right: 24, left: 8),
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: const BorderRadius.all(Radius.circular(15)),
        ),
        child: Row(
          children: [
            Expanded(
                child: Text(
              text,
              style: Theme.of(context).textTheme.labelMedium,
            )),
            const SizedBox(
              width: 8,
            ),
            IconButton(
                onPressed: () => onDeleteItemClick(),
                icon: Image.asset(
                  Assets.deleteIcon,
                  width: 25,
                ))
          ],
        ));
  }
}
