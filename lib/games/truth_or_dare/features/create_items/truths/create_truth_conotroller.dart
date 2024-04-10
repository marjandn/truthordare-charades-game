import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:truth_or_dare/core/extensions/context_extensions.dart';
import 'package:truth_or_dare/games/truth_or_dare/data/model/turth_model.dart';
import 'package:truth_or_dare/games/truth_or_dare/data/repository/truth_dare/truth_dare_repository.dart';

import '../../../../shared_widgets/text_item_widget.dart';

class CreateTruthController extends GetxController {
  ITruthDareRepository truthDareRepository;

  CreateTruthController({required this.truthDareRepository});

  final GlobalKey<AnimatedListState> animatedListKey = GlobalKey();
  final ScrollController scrollController = ScrollController();
  Future ft = Future(() {});
  final truthesList = <TruthModel>[].obs;

  getSavedTruths() {
    truthesList.clear();
    var savedTruth = truthDareRepository.getSavedTruths();

    for (var item in savedTruth) {
      ft = ft.then((data) {
        return Future.delayed(
          const Duration(milliseconds: 250),
          () {
            truthesList.add(item);
            animatedListKey.currentState!
                .insertItem(truthesList.length - 1, duration: const Duration(milliseconds: 300));
          },
        );
      });
    }
  }

  savedTruth() {
    truthDareRepository.saveTruth(truthesList);
  }

  addTruthToList(String truth) {
    if (truth.isNotEmpty) {
      for (var item in truthesList) {
        if (item.content == truth.trim()) {
          Get.context!.showSnackBar(msg: "مقدار ورودی در لیست وجود دارد!");
          return;
        }
      }

      truthesList.add(TruthModel(id: truthesList.length + 1, content: truth.trim()));

      animatedListKey.currentState!
          .insertItem(truthesList.length - 1, duration: const Duration(milliseconds: 300));

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

      savedTruth();
    }
  }

  removeSpecificTruth(int index, String truth) {
    animatedListKey.currentState!.removeItem(index, (_, animation) {
      return SlideTransition(
          position: animation.drive(Tween(begin: const Offset(-1, 0), end: const Offset(0, 0))),
          child: Obx(
            () => TextItemWidget(text: truth, onDeleteItemClick: () {}),
          ));
    });

    truthesList.removeAt(index);
    savedTruth();
  }
}
