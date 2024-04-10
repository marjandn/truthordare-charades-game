import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:truth_or_dare/core/extensions/context_extensions.dart';
import 'package:truth_or_dare/core/views/assets.dart';

import '../../../../core/views/colors.dart';
import '../../../../core/views/styles.dart';
import '../../../shared_widgets/game_scaffold.dart';
import '../carts/carts_controller.dart';
import '../game/game_screen.dart';
import '../../../shared_widgets/round_button_widget.dart';
import '../../../shared_widgets/text_item_widget.dart';
import 'names_controller.dart';

class TruthOrDareNamesSettingsScreen extends StatelessWidget {
  TruthOrDareNamesSettingsScreen({super.key});

  final NamesController _controller = Get.find<NamesController>();

  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _controller.namesList.clear();
    WidgetsBinding.instance.addPostFrameCallback((_) => _controller.getSavedNames());

    return GameScaffold(
      appBar: context.simpleAppbar(title: "بازیکنان"),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: AppStyles.borderRadius,
                      color: AppColors.whiteColor,
                    ),
                    child: TextFormField(
                      controller: _nameController,
                      textInputAction: TextInputAction.next,
                      textAlign: TextAlign.right,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          contentPadding: EdgeInsets.all(16),
                          hintText: "نام بازیکن را وارد کنید...",
                          hintStyle: TextStyle(color: Colors.grey)),
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      cursorColor: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                RoundButtonWidget(
                    onButtonTapped: () {
                      _controller.addNameToList(_nameController.text);
                      _nameController.clear();
                    },
                    btnIconPath: Assets.addIcon,
                    iconSize: 20),
              ],
            ),
          ),
          Expanded(
            child: AnimatedList(
              key: _controller.animatedListKey,
              controller: _controller.scrollController,
              initialItemCount: _controller.namesList.length,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemBuilder: (context, index, animation) {
                return SlideTransition(
                    position: animation.drive(Tween(begin: const Offset(0, -1), end: const Offset(0, 0))),
                    child: Obx(
                      () => TextItemWidget(
                          text: _controller.namesList[index].name,
                          onDeleteItemClick: () {
                            _controller.removeSpecificName(index, _controller.namesList[index].name);
                          }),
                    ));
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: 16,
              ),
              RoundButtonWidget(
                onButtonTapped: () {
                  if (_controller.namesList.length < 2) {
                    context.showSnackBar(msg: "لطفا حداقل ۲ نام وارد کنید.");
                  } else {
                    Get.find<CartsController>().fillAllContents();
                    Get.to(() => GameScreen(items: _controller.getNamesString()));
                  }
                },
                btnWidget: Lottie.asset('assets/anim/animation_arrow.json', width: 50),
              )
            ],
          ),
          // Ads Widget
        ],
      ),
    );
  }
}
