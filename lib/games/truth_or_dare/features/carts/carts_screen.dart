import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:truth_or_dare/core/global/constants.dart';
import 'package:truth_or_dare/core/views/colors.dart';
import 'package:truth_or_dare/core/views/styles.dart';

import '../../../shared_widgets/game_scaffold.dart';
import 'carts_controller.dart';
import 'widgets/dare_cart_widget.dart';
import 'widgets/truth_cart_widget.dart';

class CartsScreen extends StatefulWidget {
  final String userName;
  const CartsScreen({super.key, required this.userName});

  @override
  CartsState createState() => CartsState();
}

class CartsState extends State<CartsScreen> with TickerProviderStateMixin {
  final CartsController _controller = Get.find<CartsController>();

  late final AnimationController _animationController =
      AnimationController(vsync: this, duration: const Duration(milliseconds: 600));
  late final AnimationController _animationRareCartController =
      AnimationController(vsync: this, duration: const Duration(milliseconds: 600));

  bool _displayFront = true;
  String selectedCartType = "";

  String questionText = "";

  @override
  void dispose() {
    _animationController.dispose();
    _animationRareCartController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _animationController.forward();
    });
  }

  bool backPressed = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        _backPress();
        return false;
      },
      child: GameScaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          elevation: 0,
          centerTitle: true,
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
                onPressed: () => _backPress(),
                icon: Icon(Icons.arrow_forward_ios_rounded, color: AppColors.whiteColor)),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 1),
          child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                "${widget.userName} نوبت توئه!",
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            const SizedBox(
              height: 3,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                "یکی از کارت های زیر رو انتخاب کن",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(color: AppColors.whiteColor),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Expanded(
              child: Stack(
                children: [
                  Visibility(
                    visible: !backPressed,
                    child: GridView.count(
                      crossAxisCount: 2,
                      primary: false,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 15,
                      childAspectRatio: context.isPhone ? 0.7 : 0.9,
                      children: [
                        SlideTransition(
                          position: Tween<Offset>(begin: const Offset(1, -1), end: const Offset(0, 0))
                              .animate(
                                  CurvedAnimation(parent: _animationController, curve: Curves.decelerate)),
                          child: GestureDetector(
                            onTap: () => _showRaraCart(Constants.truthCart),
                            child: const TruthFrontCartWidget(),
                          ),
                        ),
                        SlideTransition(
                          position: Tween<Offset>(begin: const Offset(-1, -1), end: const Offset(0, 0))
                              .animate(
                                  CurvedAnimation(parent: _animationController, curve: Curves.decelerate)),
                          child: GestureDetector(
                            onTap: () => _showRaraCart(Constants.dareCart),
                            child: const DareFrontCartWidget(),
                          ),
                        ),
                        SlideTransition(
                          position: Tween<Offset>(begin: const Offset(1, 1), end: const Offset(0, 0)).animate(
                              CurvedAnimation(parent: _animationController, curve: Curves.decelerate)),
                          child: GestureDetector(
                            onTap: () => _showRaraCart(Constants.dareCart),
                            child: const DareFrontCartWidget(),
                          ),
                        ),
                        SlideTransition(
                          position: Tween<Offset>(begin: const Offset(-1, 1), end: const Offset(0, 0))
                              .animate(
                                  CurvedAnimation(parent: _animationController, curve: Curves.decelerate)),
                          child: GestureDetector(
                            onTap: () => _showRaraCart(Constants.truthCart),
                            child: const TruthFrontCartWidget(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  AnimatedCrossFade(
                    firstChild: const SizedBox(),
                    duration: const Duration(milliseconds: 300),
                    secondChild: SizedBox(
                      height: context.isPhone ? 570 : 900,
                      child: SlideTransition(
                        position: Tween<Offset>(begin: const Offset(1, -1), end: const Offset(0, 0)).animate(
                            CurvedAnimation(parent: _animationRareCartController, curve: Curves.decelerate)),
                        child: RotationTransition(
                            turns: Tween(begin: -(55 / 365).toDouble(), end: 0.toDouble()).animate(
                                CurvedAnimation(parent: _animationRareCartController, curve: Curves.easeOut)),
                            child: selectedCartType == Constants.dareCart
                                ? DareRareCartWidget(
                                    questionText: questionText,
                                    onBackClick: () {
                                      _backPress();
                                    })
                                : TruthRareCartWidget(
                                    questionText: questionText,
                                    onBackClick: () {
                                      _backPress();
                                    })),
                      ),
                    ),
                    crossFadeState: _displayFront ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }

  _backPress() {
    setState(() {
      backPressed = true;
    });
    Get.back();
  }

  _showRaraCart(String type) {
    selectedCartType = type;

    questionText = ((selectedCartType == Constants.truthCart)
        ? _controller.allTruthes[Random().nextInt(_controller.allTruthes.length)]
        : _controller.allDares[Random().nextInt(_controller.allDares.length)]);

    setState(() => _displayFront = false);
    _animationController.reverse();
    _animationRareCartController.forward();
  }
}
