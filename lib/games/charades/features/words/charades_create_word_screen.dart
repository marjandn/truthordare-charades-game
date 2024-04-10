import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:truth_or_dare/core/extensions/context_extensions.dart';
import '../../../../core/views/assets.dart';
import '../../../../core/views/colors.dart';
import '../../../../core/views/styles.dart';
import '../../../shared_widgets/game_scaffold.dart';
import '../../../shared_widgets/round_button_widget.dart';
import '../../../shared_widgets/text_item_widget.dart';
import 'charades_create_word_controller.dart';

class CharadesCreateWordScreen extends StatelessWidget {
  CharadesCreateWordScreen({super.key});

  final CharadesCreateWordController _controller = Get.find<CharadesCreateWordController>();

  final TextEditingController _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _controller.wordsList.clear();
    WidgetsBinding.instance.addPostFrameCallback((_) => _controller.getSavedWords());

    return GameScaffold(
      appBar: context.simpleAppbar(title: "کلمات من"),
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
                      controller: _contentController,
                      textAlign: TextAlign.right,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          contentPadding: EdgeInsets.all(16),
                          hintText: "کلمه را وارد کنید...",
                          hintStyle: TextStyle(color: Colors.grey)),
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      keyboardType: TextInputType.multiline,
                      minLines: 2,
                      maxLines: 2,
                      cursorColor: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                RoundButtonWidget(
                    onButtonTapped: () {
                      _controller.addWordToList(_contentController.text);
                      _contentController.clear();
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
              initialItemCount: _controller.wordsList.length,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemBuilder: (context, index, animation) {
                return SlideTransition(
                    position: animation.drive(Tween(begin: const Offset(0, -1), end: const Offset(0, 0))),
                    child: Obx(
                      () => TextItemWidget(
                          text: _controller.wordsList[index].word,
                          onDeleteItemClick: () {
                            _controller.removeSpecificWord(index, _controller.wordsList[index].word);
                          }),
                    ));
              },
            ),
          ),
          const SizedBox(
            height: 32,
          ),
        ],
      ),
    );
  }
}
