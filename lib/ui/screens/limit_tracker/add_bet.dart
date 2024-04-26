import 'package:bet_minder/data/styles.dart';
import 'package:bet_minder/main.dart';
import 'package:bet_minder/models/bet_model.dart';
import 'package:bet_minder/ui/widgets/buttons/continue.dart';
import 'package:bet_minder/ui/widgets/input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/bool_input.dart';
import '../../widgets/date_input.dart';
import '../../widgets/select_input.dart';

class AddBet extends StatefulWidget {
  final int maxSum;

  const AddBet({Key? key, required this.maxSum}) : super(key: key);

  @override
  State<AddBet> createState() => _AddBetState();
}

class _AddBetState extends State<AddBet> {
  late TextEditingController amount;
  late TextEditingController bettingOdds;
  late ValueNotifier<bool> canSave;
  late ValueNotifier<bool> isWin;
  late ValueNotifier<SportBetType?> sportType;
  late ValueNotifier<DateTime?> dateTime;

  @override
  void initState() {
    amount = TextEditingController()..addListener(() => validate());
    bettingOdds = TextEditingController()..addListener(() => validate());
    isWin = ValueNotifier(false)..addListener(() => validate());
    sportType = ValueNotifier(null)..addListener(() => validate());
    dateTime = ValueNotifier(null)..addListener(() => validate());
    canSave = ValueNotifier(false);
    super.initState();
  }

  void validate() {
    int? amountValue = int.tryParse(amount.text);
    double? bettingOddsValue =
        double.tryParse(bettingOdds.text.replaceAll(',', '.'));

    canSave.value = amountValue != null &&

        amountValue <= widget.maxSum &&
        amountValue > 0 &&
        bettingOddsValue != null &&
        sportType.value != null &&
        dateTime.value != null;
  }

  @override
  void dispose() {
    amount.dispose();
    bettingOdds.dispose();
    canSave.dispose();
    isWin.dispose();
    sportType.dispose();
    dateTime.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Add Bet'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: Column(
                    children: [
                      DTextInput(
                        controller: amount,
                        isNumber: true,
                        title: 'Amount of the bet',
                        hintText: 'Amount',
                      ),
                      const SizedBox(height: kDefaultPadding * 1.5),
                      DTextInput(
                        controller: bettingOdds,
                        isNumber: false,
                        isDouble: true,
                        title: 'Betting odds',
                        hintText: 'Amount',
                      ),
                      const SizedBox(height: kDefaultPadding * 1.5),
                      DSelectInput(
                        title: 'Set limit for 1 year',
                        controller: sportType,
                      ),
                      const SizedBox(height: kDefaultPadding * 1.5),
                      DBoolInput(
                        controller: isWin,
                        title: 'Result',
                      ),
                      const SizedBox(height: kDefaultPadding * 1.5),
                      DDateInput(
                        title: 'Date',
                        controller: dateTime,
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: kDefaultPadding),
              ValueListenableBuilder(
                  valueListenable: canSave,
                  builder: (context, value, _) {
                    return DContinueButton(
                      onTap: () {
                        if (value) {
                          int amountValue = int.parse(amount.text);
                          double bettingOddsValue = double.parse(
                              bettingOdds.text.replaceAll(',', '.'));

                          dbController.betModelController.addModel(BetModel(
                              amount: amountValue,
                              bettingOdds: bettingOddsValue,
                              typeOfSport: sportType.value!,
                              isWin: isWin.value,
                              dateTime: dateTime.value!));
                          Navigator.maybePop(context);
                        }
                      },
                      name: 'Add Bet',
                      type: value
                          ? DContinueButtonColorType.accent
                          : DContinueButtonColorType.grey,
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
