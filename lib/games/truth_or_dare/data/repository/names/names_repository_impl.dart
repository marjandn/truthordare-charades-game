import 'dart:convert';

import 'package:truth_or_dare/games/truth_or_dare/data/local/truth_dare_local_storage.dart';
import 'package:truth_or_dare/games/truth_or_dare/data/model/names_model.dart';

import 'names_repository.dart';

class NamesRepositoryImpl implements NamesRepository {
  ITruthDareLocalStorage localStorage;
  NamesRepositoryImpl({required this.localStorage});

  @override
  List<NamesModel> getSavedNames() {
    String? js = localStorage.getSavedNames();

    List<NamesModel> tempA = [];

    if (js != null) {
      Iterable l = jsonDecode(js);
      tempA = List<NamesModel>.from(l.map((model) => NamesModel.fromJson(model)));
    } else {
      tempA = [];
    }

    return tempA;
  }

  @override
  saveNames(List<NamesModel> names) {
    var js = jsonEncode(names);

    localStorage.saveNames(js);
  }
}
