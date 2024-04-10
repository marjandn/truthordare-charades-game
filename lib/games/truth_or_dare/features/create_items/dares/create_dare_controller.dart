import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:truth_or_dare/core/extensions/context_extensions.dart';
import 'package:truth_or_dare/games/truth_or_dare/data/model/dare_model.dart';

import '../../../data/repository/truth_dare/truth_dare_repository.dart';
import '../../../../shared_widgets/text_item_widget.dart';

class CreateDareController extends GetxController {
  ITruthDareRepository truthDareRepository;

  CreateDareController({required this.truthDareRepository});

  final GlobalKey<AnimatedListState> animatedListKey = GlobalKey();
  final ScrollController scrollController = ScrollController();
  Future ft = Future(() {});
  final daresList = <DareModel>[].obs;

  getSavedDares() {
    daresList.clear();
    var savedDare = truthDareRepository.getSavedDares();

    for (var item in savedDare) {
      ft = ft.then((data) {
        return Future.delayed(
          const Duration(milliseconds: 250),
          () {
            daresList.add(item);
            animatedListKey.currentState!
                .insertItem(daresList.length - 1, duration: const Duration(milliseconds: 300));
          },
        );
      });
    }
  }

  savedDare() {
    truthDareRepository.saveDare(daresList);
  }

  addDareToList(String dare) {
    if (dare.isNotEmpty) {
      for (var item in daresList) {
        if (item.content == dare.trim()) {
          Get.context!.showSnackBar(msg: "مقدار ورودی در لیست وجود دارد!");
          return;
        }
      }

      daresList.add(DareModel(id: daresList.length + 1, content: dare.trim()));

      animatedListKey.currentState!
          .insertItem(daresList.length - 1, duration: const Duration(milliseconds: 300));

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

      savedDare();
    }
  }

  removeSpecificDare(int index, String dare) {
    animatedListKey.currentState!.removeItem(index, (_, animation) {
      return SlideTransition(
          position: animation.drive(Tween(begin: const Offset(-1, 0), end: const Offset(0, 0))),
          child: Obx(
            () => TextItemWidget(text: dare, onDeleteItemClick: () {}),
          ));
    });

    daresList.removeAt(index);
    savedDare();
  }
}
