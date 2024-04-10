import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/global/constants.dart';

abstract class ITruthDareLocalStorage {
  saveNames(String names);
  saveDares(String dares);
  saveTruthes(String truthes);

  String? getSavedNames();
  String? getSavedTruthes();
  String? getSavedDares();
}

class TruthDareLocalStorage implements ITruthDareLocalStorage {
  SharedPreferences preferences;

  TruthDareLocalStorage({required this.preferences});

  @override
  saveNames(String names) async {
    await preferences.setString(Constants.storageNamesKey, names);
  }

  @override
  saveTruthes(String truthes) async {
    await preferences.setString(Constants.storageTruthesKey, truthes);
  }

  @override
  saveDares(String dares) async {
    await preferences.setString(Constants.storageDaresKey, dares);
  }

  @override
  String? getSavedNames() {
    String? js = preferences.getString(Constants.storageNamesKey);

    return js;
  }

  @override
  String? getSavedTruthes() {
    String? js = preferences.getString(Constants.storageTruthesKey);

    return js;
  }

  @override
  String? getSavedDares() {
    String? js = preferences.getString(Constants.storageDaresKey);

    return js;
  }
}
