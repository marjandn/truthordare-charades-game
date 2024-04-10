import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:truth_or_dare/core/extensions/context_extensions.dart';
import 'package:truth_or_dare/games/charades/data/entity/charades_word.dart';
import 'package:truth_or_dare/games/charades/data/repository/charades_repository.dart';

import '../../../shared_widgets/text_item_widget.dart';

class CharadesCreateWordController extends GetxController {
  final ICharadesRepository _charadesRepository;

  CharadesCreateWordController(this._charadesRepository);

  final GlobalKey<AnimatedListState> animatedListKey = GlobalKey();
  final ScrollController scrollController = ScrollController();
  Future ft = Future(() {});
  final wordsList = <CharadesWord>[].obs;

  getSavedWords() {
    wordsList.clear();
    var savedWord = _charadesRepository.getSaveWords();

    for (var item in savedWord) {
      ft = ft.then((data) {
        return Future.delayed(
          const Duration(milliseconds: 250),
          () {
            wordsList.add(item);
            animatedListKey.currentState!
                .insertItem(wordsList.length - 1, duration: const Duration(milliseconds: 300));
          },
        );
      });
    }
  }

  savedWord() {
    _charadesRepository.saveWords(wordsList);
  }

  addWordToList(String word) {
    if (word.isNotEmpty) {
      for (var item in wordsList) {
        if (item.word == word.trim()) {
          Get.context!.showSnackBar(msg: "مقدار ورودی در لیست وجود دارد!");
          return;
        }
      }

      wordsList.add(CharadesWord(id: wordsList.length + 1, word: word.trim()));

      animatedListKey.currentState!
          .insertItem(wordsList.length - 1, duration: const Duration(milliseconds: 300));

      Future.delayed(
        const Duration(microseconds: 400),
        () {
          scrollController.animateTo(
            scrollController.position.maxScrollExtent,
            curve: Curves.easeOut,
            duration: const Duration(milliseconds: 500),
          );
        },
      );

      savedWord();
    }
  }

  removeSpecificWord(int index, String word) {
    animatedListKey.currentState!.removeItem(index, (_, animation) {
      return SlideTransition(
          position: animation.drive(Tween(begin: const Offset(-1, 0), end: const Offset(0, 0))),
          child: Obx(
            () => TextItemWidget(text: word, onDeleteItemClick: () {}),
          ));
    });

    wordsList.removeAt(index);
    savedWord();
  }
}
