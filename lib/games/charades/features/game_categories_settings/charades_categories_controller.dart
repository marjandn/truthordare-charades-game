import 'package:get/get.dart';
import 'package:truth_or_dare/games/charades/data/repository/charades_repository.dart';

import '../../data/entity/word_category.dart';

class CharadesCategoriesController extends GetxController {
  final ICharadesRepository _charadesRepository;

  CharadesCategoriesController(this._charadesRepository);

  late final List<WordCategory> categories;

  var selectedCategories = <int>[].obs;

  getCategories() {
    categories = _charadesRepository.getWordCategories();
  }

  changeCategorySelection(int catId) {
    selectedCategories.contains(catId)
        ? selectedCategories.remove(catId)
        : selectedCategories.add(catId);
  }

  List<String> getSelectedWords() {
    List<String> words = [];
    for (int selectedCatId in selectedCategories) {
      words.addAll(categories.where((cat) => cat.categoryId == selectedCatId).first.categoryWords);
    }

    return words;
  }
}
