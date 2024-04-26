import 'package:bet_minder/ui/widgets/extentions.dart';
import 'package:hive/hive.dart';

import '../../models/bet_model.dart';
import '../../models/limit_controller.dart';

class LimitControllerModelController
    extends DBBoxController<LimitControllerModel> {
  @override
  TypeAdapter<LimitControllerModel> get adapter =>
      LimitControllerModelAdapter();

  @override
  Future<void> addModel(
    LimitControllerModel model,
  ) async {
    await deleteAll();
    return super.addModel(model);
  }

  @override
  String get modelName => 'limitControllerModel';
}

class BetModelController extends DBBoxController<BetModel> {
  @override
  TypeAdapter<BetModel> get adapter => BetModelAdapter();

  int daySum() {
    int result = 0;
    DateTime dateTime = DateTime.now();
    List<BetModel> models = getModels();

    for (var element in models) {
      if (element.dateTime == dateTime.onlyDate) {
        result += element.amount;
      }
    }

    return result;
  }

  int monthSum() {
    DateTime dateTime = DateTime.now();
    int result = 0;
    List<BetModel> models = getModels();

    for (var element in models) {
      if (element.dateTime.month == dateTime.month &&
          element.dateTime.year == dateTime.year) {
        result += element.amount;
      }
    }

    return result;
  }

  int yearSum() {
    DateTime dateTime = DateTime.now();
    int result = 0;
    List<BetModel> models = getModels();

    int year = dateTime.onlyDate.year;

    for (var element in models) {
      if (element.dateTime.year == year) {
        result += element.amount;
      }
    }

    return result;
  }

  @override
  String get modelName => 'betModel';
}

abstract class DBBoxController<Model> {
  late String modelName;

  late TypeAdapter<Model> adapter;

  late Box<Model> box;

  Future<void> initBox() async {
    if (!Hive.isAdapterRegistered(adapter.typeId)) {
      Hive.registerAdapter<Model>(adapter);
    }
    box = await Hive.openBox(modelName);
  }

  Stream<BoxEvent> boxStream() => box.watch();

  Future<void> addModel(Model model) async {
    await box.add(model);
  }

  Future<void> putModel({required int indexModel, required Model model}) async {
    await box.put(box.keyAt(indexModel), model);
  }

  Future<void> updateList(List<Model> models) async {
    await box.clear();
    await box.addAll(models);
  }

  Future<void> deleteModel(int index) async {
    await box.delete(box.keyAt(index));
  }

  Future<void> deleteAll() async {
    await box.deleteAll(box.keys);
  }

  List<Model> getModels() => box.values.toList();

  Model? getLastModel() {
    List<Model> models = box.values.toList();
    if (models.isNotEmpty) {
      return models.last;
    }
    return null;
  }
}
