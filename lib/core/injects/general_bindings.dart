import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:truth_or_dare/games/charades/data/local/charades_local_storage.dart';
import 'package:truth_or_dare/games/charades/data/repository/charades_repository.dart';
import 'package:truth_or_dare/games/charades/features/game/charades_game_controller.dart';
import 'package:truth_or_dare/games/charades/features/game_categories_settings/charades_categories_controller.dart';
import 'package:truth_or_dare/games/charades/features/group_settings/charades_group_settings_controller.dart';
import 'package:truth_or_dare/games/truth_or_dare/data/local/truth_dare_local_storage.dart';
import 'package:truth_or_dare/games/truth_or_dare/data/repository/names/names_repository.dart';
import 'package:truth_or_dare/games/truth_or_dare/data/repository/names/names_repository_impl.dart';
import 'package:truth_or_dare/games/truth_or_dare/data/repository/truth_dare/truth_dare_repository.dart';
import '../../games/charades/features/game_settings/charades_settings_controller.dart';
import '../../games/charades/features/words/charades_create_word_controller.dart';
import '../../games/truth_or_dare/features/carts/carts_controller.dart';
import '../../games/truth_or_dare/features/create_items/dares/create_dare_controller.dart';
import '../../games/truth_or_dare/features/names/names_controller.dart';
import '../../games/truth_or_dare/features/create_items/truths/create_truth_conotroller.dart';

class GeneralBindings extends Bindings {
  @override
  Future dependencies() async {
    await Get.putAsync<SharedPreferences>(() => SharedPreferences.getInstance());
    Get.put<ITruthDareLocalStorage>(TruthDareLocalStorage(preferences: Get.find()));

    Get.put<NamesRepository>(NamesRepositoryImpl(localStorage: Get.find()));

    Get.put<NamesController>(NamesController(namesRepository: Get.find<NamesRepository>()));

    Get.put<ITruthDareRepository>(TruthDareRepository(localStorage: Get.find()));
    Get.put<CreateTruthController>(
        CreateTruthController(truthDareRepository: Get.find<ITruthDareRepository>()));
    Get.put<CreateDareController>(
        CreateDareController(truthDareRepository: Get.find<ITruthDareRepository>()));

    Get.put<CartsController>(CartsController(truthDareRepository: Get.find<ITruthDareRepository>()));

    Get.lazyPut<ICharadesLocalStorage>(() => CharadesLocalStorage(preferences: Get.find()), fenix: true);
    Get.lazyPut<ICharadesRepository>(() => CharadesRepository(Get.find<ICharadesLocalStorage>()),
        fenix: true);
    Get.lazyPut<CharadesGroupSettingsController>(() => CharadesGroupSettingsController(), fenix: true);
    Get.lazyPut<CharadesCategoriesController>(
        () => CharadesCategoriesController(Get.find<ICharadesRepository>())..getCategories(),
        fenix: true);
    Get.lazyPut<CharadesSettingsController>(() => CharadesSettingsController(), fenix: true);
    Get.lazyPut<CharadesGameController>(() => CharadesGameController(), fenix: true);
    Get.lazyPut<CharadesCreateWordController>(
        () => CharadesCreateWordController(Get.find<ICharadesRepository>()),
        fenix: true);
  }
}
