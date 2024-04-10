
import '../../model/names_model.dart';

abstract class NamesRepository{
  saveNames(List<NamesModel> names);

    List<NamesModel> getSavedNames();
}