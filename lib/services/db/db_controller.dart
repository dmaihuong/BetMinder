import 'package:bet_minder/models/bet_model.dart';
import 'package:hive/hive.dart';
import 'db_box_controller.dart';

class DBController {
  late LimitControllerModelController limitControllerModelController;
  late BetModelController betModelController;

  Future<void> initDB() async {
    limitControllerModelController = LimitControllerModelController();
    await limitControllerModelController.initBox();

    if (!Hive.isAdapterRegistered(SportBetTypeAdapter().typeId)) {
      Hive.registerAdapter<SportBetType>(SportBetTypeAdapter());
    }
    betModelController = BetModelController();
    await betModelController.initBox();
  }
}
