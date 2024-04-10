import 'package:flutter/material.dart';
import 'package:truth_or_dare/core/views/colors.dart';

class GameScaffold extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;
  const GameScaffold({Key? key, required this.body, this.appBar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.primaryColor,
              AppColors.pastelOrange,
            ],
          ),
        ),
        child: body,
      ),
    );
  }
}
