import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:truth_or_dare/core/extensions/context_extensions.dart';
import 'package:truth_or_dare/games/truth_or_dare/data/model/names_model.dart';
import 'package:truth_or_dare/games/truth_or_dare/data/repository/names/names_repository.dart';

import '../../../shared_widgets/text_item_widget.dart';

class NamesController extends GetxController {
  NamesRepository namesRepository;

  NamesController({required this.namesRepository});

  final GlobalKey<AnimatedListState> animatedListKey = GlobalKey();
  final ScrollController scrollController = ScrollController();
  Future ft = Future(() {});
  final namesList = <NamesModel>[].obs;

  getSavedNames() {
    namesList.clear();
    var savedNames = namesRepository.getSavedNames();

    for (var item in savedNames) {
      ft = ft.then((data) {
        return Future.delayed(
          const Duration(milliseconds: 250),
          () {
            namesList.add(item);
            animatedListKey.currentState!
                .insertItem(namesList.length - 1, duration: const Duration(milliseconds: 300));
          },
        );
      });
    }
  }

  saveNames() {
    namesRepository.saveNames(namesList);
  }

  addNameToList(String name) {
    if (name.isNotEmpty) {
      for (var item in namesList) {
        if (item.name == name.trim()) {
          Get.context!.showSnackBar(msg: "اسم ورودی در لیست وجود دارد!");
          return;
        }
      }

      namesList.add(NamesModel(id: namesList.length + 1, name: name.trim()));

      animatedListKey.currentState!
          .insertItem(namesList.length - 1, duration: const Duration(milliseconds: 300));

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

      saveNames();
    }
  }

  removeSpecificName(int index, String name) {
    animatedListKey.currentState!.removeItem(index, (_, animation) {
      return SlideTransition(
          position: animation.drive(Tween(begin: const Offset(-1, 0), end: const Offset(0, 0))),
          child: Obx(
            () => TextItemWidget(text: name, onDeleteItemClick: () {}),
          ));
    });

    namesList.removeAt(index);
    saveNames();
  }

  List<String> getNamesString() {
    List<String> names = [];
    for (var item in namesList) {
      names.add(item.name);
    }

    return names;
  }
}
