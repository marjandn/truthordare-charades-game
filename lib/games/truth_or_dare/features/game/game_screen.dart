import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:truth_or_dare/core/global/constants.dart';
import 'package:truth_or_dare/core/views/colors.dart';

import '../../../../core/views/assets.dart';
import '../../../shared_widgets/game_scaffold.dart';
import '../carts/carts_screen.dart';
import '../../../shared_widgets/round_button_widget.dart';

class GameScreen extends StatefulWidget {
  final List<String> items;

  const GameScreen({super.key, required this.items});

  @override
  GameState createState() => GameState();
}

class GameState extends State<GameScreen> {
  late int selectedInt;
  StreamController<int> selected = StreamController<int>();

  @override
  void initState() {
    super.initState();
  }

  _spingWheel() {
    setState(() {
      selectedInt = Fortune.randomInt(0, widget.items.length);
      selected.add(selectedInt);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GameScaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          elevation: 0,
          title: Text('جرات حقیقت',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(color: AppColors.whiteColor)),
          centerTitle: true,
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(Icons.arrow_forward_ios_rounded, color: AppColors.whiteColor)),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: SizedBox(
                height: context.isPhone ? 450 : 900,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 35),
                      child: FortuneWheel(
                        animateFirst: false,
                        selected: selected.stream,
                        onFling: () => _spingWheel(),
                        indicators: const [
                          FortuneIndicator(
                            child: SizedBox(),
                          )
                        ],
                        items: [
                          for (int i = 0; i < widget.items.length; i++)
                            FortuneItem(
                              child: Text(
                                widget.items[i],
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(color: AppColors.whiteColor),
                              ),
                              style: FortuneItemStyle(
                                color: AppColors.wheelItemColors[i],
                                //((i%2) == 0)? Theme.of(context).colorScheme.secondary: Theme.of(context).colorScheme.secondary,
                                borderColor: AppColors.whiteColor,
                                borderWidth: 7,
                              ),
                            ),
                        ],
                        onAnimationEnd: () => Get.to(() => CartsScreen(userName: widget.items[selectedInt])),
                      ),
                    ),
                    Align(
                        alignment: Alignment.topCenter,
                        child: Image.asset(
                          Assets.wheelIndicatorIcon,
                          width: 70,
                        ))
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RoundButtonWidget(
                    onButtonTapped: () => _spingWheel(),
                    btnWidget: Lottie.asset(Assets.wheeAnimation, width: 50),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
