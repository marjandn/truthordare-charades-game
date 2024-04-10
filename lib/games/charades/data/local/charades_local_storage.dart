import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/global/constants.dart';

abstract class ICharadesLocalStorage {
  saveWords(String names);

  String? getSavedWords();
}

class CharadesLocalStorage extends ICharadesLocalStorage {
  SharedPreferences preferences;

  CharadesLocalStorage({required this.preferences});

  @override
  String? getSavedWords() {
    String? js = preferences.getString(Constants.storageCharadesWords);

    return js;
  }

  @override
  saveWords(String words) async {
    await preferences.setString(Constants.storageCharadesWords, words);
  }
}
