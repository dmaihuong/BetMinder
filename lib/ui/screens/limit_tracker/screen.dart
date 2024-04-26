import 'package:auto_size_text/auto_size_text.dart';
import 'package:bet_minder/data/assets.dart';
import 'package:bet_minder/data/styles.dart';
import 'package:bet_minder/main.dart';
import 'package:bet_minder/models/limit_controller.dart';
import 'package:bet_minder/ui/screens/limit_tracker/add_bet.dart';
import 'package:bet_minder/ui/widgets/buttons/click_area.dart';
import 'package:bet_minder/ui/widgets/buttons/continue.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LimitTrackerScreen extends StatefulWidget {
  const LimitTrackerScreen({Key? key}) : super(key: key);

  @override
  State<LimitTrackerScreen> createState() => _LimitTrackerScreenState();
}

enum TypeLimit { day, month, year }

class _LimitTrackerScreenState extends State<LimitTrackerScreen> {
  late ValueNotifier<TypeLimit> typeLimit;

  @override
  void initState() {
    typeLimit = ValueNotifier(TypeLimit.day);
    super.initState();
  }

  @override
  void dispose() {
    typeLimit.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Limit Tracker'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Column(
          children: [
            _BuildTapBar(
              typeLimit: typeLimit,
            ),
            const SizedBox(height: kDefaultPadding),
            Expanded(
              child: StreamBuilder(
                  stream: dbController.betModelController.boxStream(),
                  builder: (context, snapshot) {
                    LimitControllerModel model = dbController
                        .limitControllerModelController
                        .getLastModel()!;
                    int sumDay = dbController.betModelController.daySum();
                    int sumMonth = dbController.betModelController.monthSum();
                    int sumYear = dbController.betModelController.yearSum();
                    int maxSum = model.dayLimit - sumDay;

                    return Column(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Image.asset(
                                        DAssetImages.limitTracker(
                                            maxSum == 0),
                                      ),
                                    ),
                                    const SizedBox(height: kDefaultPadding/2),
                                    AutoSizeText(
                                      maxSum == 0
                                          ? 'Your betting limits are exhausted for\nthis period, you can change them in the\nsettings'
                                          : 'You are within the limit\nYou can continue to place your bets\n\n',
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall,
                                      maxLines: 3,
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(height: kDefaultPadding),
                              ValueListenableBuilder(
                                  valueListenable: typeLimit,
                                  builder: (context, value, _) {
                                    int limit = value == TypeLimit.day
                                        ? model.dayLimit
                                        : value == TypeLimit.month
                                            ? model.monthLimit
                                            : model.yearLimit;
                                    int sum = value == TypeLimit.day
                                        ? sumDay
                                        : value == TypeLimit.month
                                            ? sumMonth
                                            : sumYear;
                                    return Column(
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              child:
                                                  Text('Current bets \$$sum'),
                                            ),
                                            Text('\$$limit')
                                          ],
                                        ),
                                        const SizedBox(
                                            height: kDefaultPadding / 2),
                                        ClipRRect(
                                          borderRadius: kBorderRadius,
                                          child: LayoutBuilder(
                                              builder: (context, constrains) {
                                            return Stack(
                                              children: [
                                                Container(
                                                  height: 30,
                                                  width: double.infinity,
                                                  decoration:
                                                      const BoxDecoration(
                                                    gradient: LinearGradient(
                                                        begin: Alignment(-1, 1),
                                                        end: Alignment(1, 0),
                                                        colors: [
                                                          Color.fromRGBO(
                                                              162, 223, 249, 1),
                                                          Color.fromRGBO(
                                                              80, 83, 255, 1)
                                                        ]),
                                                  ),
                                                ),
                                                Positioned(
                                                    left: (constrains.maxWidth /
                                                            limit) *
                                                        sum,
                                                    child: Container(
                                                        width: 3,
                                                        height: 30,
                                                        color: const Color
                                                            .fromRGBO(
                                                            0, 209, 255, 1)))
                                              ],
                                            );
                                          }),
                                        ),
                                      ],
                                    );
                                  })
                            ],
                          ),
                        ),
                        const SizedBox(height: kDefaultPadding * 1.5),
                        DContinueButton(
                            onTap: () {
                              if (maxSum > 0) {
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                      builder: (context) => AddBet(
                                          maxSum: model.dayLimit - sumDay),
                                    ));
                              }
                            },
                            type: maxSum > 0
                                ? DContinueButtonColorType.accent
                                : DContinueButtonColorType.grey,
                            name: 'Add Bet')
                      ],
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

class _BuildTapBar extends StatelessWidget {
  final ValueNotifier<TypeLimit> typeLimit;

  const _BuildTapBar({Key? key, required this.typeLimit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      decoration: BoxDecoration(
          color: kGreyColor.withOpacity(0.3), borderRadius: kBorderRadius),
      padding: const EdgeInsets.all(2),
      child: ValueListenableBuilder(
          valueListenable: typeLimit,
          builder: (context, value, _) {
            return Row(
              children: [
                Expanded(
                  child: ClickArea(
                    onTap: () => typeLimit.value = TypeLimit.day,
                    child: Container(
                      decoration: BoxDecoration(
                          color: value == TypeLimit.day
                              ? Theme.of(context).colorScheme.secondary
                              : null,
                          borderRadius: kBorderRadius),
                      child: Center(
                        child: Text(
                          'Day',
                          style: TextStyle(
                              fontWeight: value == TypeLimit.year
                                  ? null
                                  : FontWeight.w400,
                              fontSize: 13,
                              color: value == TypeLimit.day
                                  ? kWhiteText
                                  : Theme.of(context).colorScheme.secondary),
                        ),
                      ),
                    ),
                  ),
                ),
                if (value == TypeLimit.year)
                  const VerticalDivider(
                    indent: 5,
                    endIndent: 5,
                    width: 0,
                  ),
                Expanded(
                  child: ClickArea(
                    onTap: () => typeLimit.value = TypeLimit.month,
                    child: Container(
                      decoration: BoxDecoration(
                          color: value == TypeLimit.month
                              ? Theme.of(context).colorScheme.secondary
                              : null,
                          borderRadius: kBorderRadius),
                      child: Center(
                        child: Text(
                          'Month',
                          style: TextStyle(
                              fontWeight: value == TypeLimit.year
                                  ? null
                                  : FontWeight.w400,
                              fontSize: 13,
                              color: value == TypeLimit.month
                                  ? kWhiteText
                                  : Theme.of(context).colorScheme.secondary),
                        ),
                      ),
                    ),
                  ),
                ),
                if (value == TypeLimit.day)
                  const VerticalDivider(
                    indent: 5,
                    endIndent: 5,
                    width: 0,
                  ),
                Expanded(
                  child: ClickArea(
                    onTap: () => typeLimit.value = TypeLimit.year,
                    child: Container(
                      decoration: BoxDecoration(
                          color: value == TypeLimit.year
                              ? Theme.of(context).colorScheme.secondary
                              : null,
                          borderRadius: kBorderRadius),
                      child: Center(
                        child: Text(
                          'Year',
                          style: TextStyle(
                              color: value == TypeLimit.year
                                  ? kWhiteText
                                  : Theme.of(context).colorScheme.secondary,
                              fontSize: 13,
                              fontWeight: value == TypeLimit.year
                                  ? null
                                  : FontWeight.w400),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
