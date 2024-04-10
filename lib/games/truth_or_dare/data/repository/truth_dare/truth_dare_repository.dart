import 'dart:convert';
import 'package:truth_or_dare/games/truth_or_dare/data/model/dare_model.dart';
import 'package:truth_or_dare/games/truth_or_dare/data/model/turth_model.dart';

import 'package:truth_or_dare/games/truth_or_dare/data/local/truth_dare_local_storage.dart';

abstract class ITruthDareRepository {
  saveTruth(List<TruthModel> truthes);
  saveDare(List<DareModel> dares);

  List<TruthModel> getSavedTruths();
  List<DareModel> getSavedDares();
}

class TruthDareRepository implements ITruthDareRepository {
  ITruthDareLocalStorage localStorage;
  TruthDareRepository({required this.localStorage});

  @override
  List<DareModel> getSavedDares() {
    String? js = localStorage.getSavedDares();

    List<DareModel> tempA = [];

    if (js != null) {
      Iterable l = jsonDecode(js);
      tempA = List<DareModel>.from(l.map((model) => DareModel.fromJson(model)));
    } else {
      tempA = [];
    }

    return tempA;
  }

  @override
  List<TruthModel> getSavedTruths() {
    String? js = localStorage.getSavedTruthes();

    List<TruthModel> tempA = [];

    if (js != null) {
      Iterable l = jsonDecode(js);
      tempA = List<TruthModel>.from(l.map((model) => TruthModel.fromJson(model)));
    } else {
      tempA = [];
    }

    return tempA;
  }

  @override
  saveDare(List<DareModel> dares) {
    var js = jsonEncode(dares);

    localStorage.saveDares(js);
  }

  @override
  saveTruth(List<TruthModel> truthes) {
    var js = jsonEncode(truthes);

    localStorage.saveTruthes(js);
  }
}
