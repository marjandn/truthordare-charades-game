import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:truth_or_dare/games/truth_or_dare/data/model/dare_model.dart';
import 'package:truth_or_dare/games/truth_or_dare/data/model/turth_model.dart';
import 'package:truth_or_dare/games/truth_or_dare/data/repository/truth_dare/truth_dare_repository.dart';

import '../../../../core/global/constants.dart';

class CartsController extends GetxController {
  ITruthDareRepository truthDareRepository;

  List<String> allTruthes = [];
  List<String> allDares = [];

  CartsController({required this.truthDareRepository});

  fillAllContents() {
    allTruthes.clear();
    List<TruthModel> savedTruthes = truthDareRepository.getSavedTruths();

    for (var item in savedTruthes) {
      allTruthes.add(item.content);
    }

    allTruthes.addAll(Constants.truthCarts.values);

    allDares.clear();
    List<DareModel> savedDares = truthDareRepository.getSavedDares();

    for (var item in savedDares) {
      allDares.add(item.content);
    }

    allDares.addAll(Constants.dareCarts.values);
  }
}
