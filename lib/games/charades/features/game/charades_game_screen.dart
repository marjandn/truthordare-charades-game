import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:truth_or_dare/core/utility/utility.dart';
import 'package:truth_or_dare/core/views/assets.dart';

import 'charades_game_controller.dart';
import 'widgets/charades_game_clickable_widget.dart';
import 'widgets/charades_game_info_widget.dart';
import 'widgets/charades_game_points_widget.dart';

class CharadesGameScreen extends StatefulWidget {
  const CharadesGameScreen({super.key});

  @override
  State<CharadesGameScreen> createState() => _CharadesGameScreenState();
}

class _CharadesGameScreenState extends State<CharadesGameScreen> {
  bool hasGuide = true;

  final CharadesGameController _controller = Get.find<CharadesGameController>();

  @override
  void initState() {
    super.initState();

    setForceLandscapeOritation();

    _controller.startTimer();
  }

  @override
  void dispose() {
    setForcePortrateOritation();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
          body: Stack(children: [
        Visibility(
          visible: hasGuide,
          child: Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () => _controller.addCorrectWord(),
              child: Image.asset(
                Assets.charadesCorrectBgImage,
                height: Get.height,
                width: 300,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        Visibility(
          visible: hasGuide,
          child: Align(
            alignment: Alignment.centerLeft,
            child: GestureDetector(
              onTap: () => _controller.addWrongWord(),
              child: Image.asset(
                Assets.charadesWrongBgImage,
                height: Get.height,
                width: 300,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        Positioned(
          top: 26,
          right: 30,
          left: 30,
          child: CharadesGameInfoWidget(),
        ),
        Align(
          alignment: Alignment.center,
          child: CharadesGameClickable(),
        ),
        Positioned(
          bottom: 26,
          right: 30,
          left: 30,
          child: CharadesGamePointsWidget(),
        ),
      ])),
    );
  }
}
