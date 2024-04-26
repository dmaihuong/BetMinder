import 'dart:async';
import 'package:apphud/apphud.dart';
import 'package:bet_minder/ui/screens/splash/screen.dart';
import 'package:bet_minder/ui/widgets/premium.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'data/styles.dart';
import 'models/limit_controller.dart';
import 'services/db/db_controller.dart';

policyPr() {
  launchUrl(Uri.parse(
      'https://doc-hosting.flycricket.io/betminder-privacy-policy/f4624bec-7764-4fa6-bf77-63e47fe1e07d/privacy'));
}

usePr() {
  launchUrl(Uri.parse(
      'https://doc-hosting.flycricket.io/betminder-terms-of-use/e1c5355f-5cbf-43dc-b0d5-1be098fcc90b/terms'));
}

supportPr() {
  launchUrl(Uri.parse('https://www.cognitoforms.com/HuongDo1/SupportForm'));
}

final appHud = 'app_iEqy1G8fuG6rpapP3x5eoPqKi9HgcP';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Apphud.start(apiKey: appHud);
  await Hive.initFlutter();
  await dbController.initDB();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MyApp());
  });
}

DBController dbController = DBController();

final StreamController<ModelController> premiumController =
    StreamController.broadcast();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ModelController>(
        future: _startController(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return WidgetsApp(
              debugShowCheckedModeBanner: false,
              color: kLightBackgroundColor,
              builder: (context, child) {
                return Scaffold(
                  backgroundColor: kLightBackgroundColor,
                  body: Center(child: Container()),
                );
              },
            );
          }

          return StreamProvider<ModelController>(
            create: (context) => premiumController.stream,
            initialData: snapshot.data!,
            builder: (context, _) {
              ModelController controller = context.watch<ModelController>();

              return KeyboardDismissOnTap(
                child: MaterialApp(
                    debugShowCheckedModeBanner: false,
                    theme: AppTheme.lightTheme,
                    home: const SplashScreen()),
              );
            },
          );
        });
  }

  Future<ModelController> _startController() async {
    LimitControllerModel? model =
        dbController.limitControllerModelController.getLastModel();
    return ModelController(isPremium: false, model: model);
  }
}

class ModelController {
  final bool isPremium;
  final LimitControllerModel? model;

  ModelController copyWith({bool? isPremium, LimitControllerModel? model}) {
    return ModelController(
        isPremium: isPremium ?? this.isPremium, model: model ?? this.model);
  }

  ModelController({required this.isPremium, this.model});
}
