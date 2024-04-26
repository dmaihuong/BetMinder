import 'package:bet_minder/data/styles.dart';
import 'package:bet_minder/main.dart';
import 'package:bet_minder/models/limit_controller.dart';
import 'package:bet_minder/ui/screens/app_screen.dart';
import 'package:bet_minder/ui/widgets/buttons/click_area.dart';
import 'package:bet_minder/ui/widgets/buttons/continue.dart';
import 'package:bet_minder/ui/widgets/input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LimitSettings extends StatefulWidget {
  const LimitSettings({Key? key}) : super(key: key);

  @override
  State<LimitSettings> createState() => _LimitSettingsState();
}

class _LimitSettingsState extends State<LimitSettings> {
  late TextEditingController dayLimit;

  late TextEditingController monthLimit;
  late TextEditingController yearLimit;
  late ValueNotifier<bool> canSave;

  @override
  void initState() {
    canSave = ValueNotifier(false);
    dayLimit = TextEditingController()..addListener(() => _validate());

    monthLimit = TextEditingController()..addListener(() => _validate());
    yearLimit = TextEditingController()..addListener(() => _validate());
    super.initState();
  }

  void _validate() {
    int? _dayLimit = int.tryParse(dayLimit.text);

    int? _monthLimit = int.tryParse(monthLimit.text);
    int? _yearLimit = int.tryParse(yearLimit.text);
    canSave.value = _dayLimit != null &&
        _monthLimit != null &&
        (_dayLimit * 30 <= _monthLimit) &&
        _yearLimit != null &&
        (_monthLimit * 12 <= _yearLimit);
  }

  @override
  void dispose() {
    canSave.dispose();
    dayLimit.dispose();

    monthLimit.dispose();
    yearLimit.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Limit Settings'),
      ),
      resizeToAvoidBottomInset: false,
      body: ClickArea(
        onTap: () {
          ModelController modelController = context.read<ModelController>();
          if (modelController.model != null) {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            } else {
              Navigator.pushReplacement(context,
                  CupertinoPageRoute(builder: (context) => const AppScreen()));
            }
          }
        },
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(kDefaultPadding),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Column(
                      children: [
                        DTextInput(
                          title: 'Set limit for 1 day',
                          controller: dayLimit,
                          hintText: 'Day Limit',
                          isNumber: true,
                        ),
                        const SizedBox(height: kDefaultPadding * 1.5),
                        DTextInput(
                          title: 'Set limit for 1 month',
                          controller: monthLimit,
                          hintText: 'Month Limit',
                          isNumber: true,
                        ),
                        const SizedBox(height: kDefaultPadding * 1.5),
                        DTextInput(
                          title: 'Set limit for 1 year',
                          controller: yearLimit,
                          hintText: 'Year Limit',
                          isNumber: true,
                        ),
                      ],
                    ),
                  ),
                ),
                ValueListenableBuilder(
                    valueListenable: canSave,
                    builder: (context, value, _) {
                      return DContinueButton(
                        onTap: () {
                          if (value) {
                            ModelController modelController =
                                context.read<ModelController>();
                            LimitControllerModel model = LimitControllerModel(
                                dayLimit: int.parse(dayLimit.text),
                                monthLimit: int.parse(monthLimit.text),
                                yearLimit: int.parse(yearLimit.text));
                            dbController.limitControllerModelController
                                .addModel(model);
                            premiumController.sink
                                .add(modelController.copyWith(model: model));
                            if (Navigator.canPop(context)) {
                              Navigator.pop(context);
                            } else {
                              Navigator.pushReplacement(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (context) => const AppScreen()));
                            }
                          }
                        },
                        name: 'Confirm',
                        type: value
                            ? DContinueButtonColorType.accent
                            : DContinueButtonColorType.grey,
                      );
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
