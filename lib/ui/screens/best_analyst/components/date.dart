import 'package:bet_minder/data/styles.dart';
import 'package:bet_minder/main.dart';
import 'package:bet_minder/models/bet_model.dart';
import 'package:bet_minder/ui/widgets/buttons/click_area.dart';
import 'package:bet_minder/ui/widgets/extentions.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class BADateType extends StatefulWidget {
  const BADateType({Key? key}) : super(key: key);

  @override
  State<BADateType> createState() => _BADateTypeState();
}

class _BADateTypeState extends State<BADateType> {
  late ValueNotifier<DateTime> date;

  @override
  void initState() {
    DateTime now = DateTime.now().onlyDate;
    date = ValueNotifier(
        now.subtract(Duration(days: now.day - (now.weekday - 1))));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: date,
        builder: (context, value, _) {
          List<DateTime> dateTimes = List.generate(7, (index) {
            return value.copyWith(day: value.day + index);
          });

          List<BetModel> allBetModels =
              dbController.betModelController.getModels();

          List<BetModel> betModels = allBetModels
              .where((element) => dateTimes.contains(element.dateTime.onlyDate))
              .toList();

          DateTime? activeDateOf;
          int activeDateLengthOf = 0;
          DateTime? mostBetsWonOn;
          DateTime? mostBetsLostOn;
          int mostBetsWonOnValue = 0;
          int mostBetsLostOnValue = 0;

          List<_Model> models = [];

          for (var element in allBetModels) {
            List<BetModel> elementModels = betModels
                .where((e) => e.dateTime.onlyDate == element.dateTime)
                .toList();

            if (elementModels.where((element) => element.isWin).length >
                    mostBetsWonOnValue ||
                mostBetsWonOn == null) {
              mostBetsWonOn = element.dateTime;
              mostBetsWonOnValue =
                  elementModels.where((element) => element.isWin).length;
            }

            if (elementModels.where((element) => !element.isWin).length <=
                    mostBetsLostOnValue ||
                mostBetsLostOn == null) {
              mostBetsLostOn = element.dateTime;
              mostBetsLostOnValue =
                  elementModels.where((element) => element.isWin).length;
            }

            if (elementModels.length > activeDateLengthOf ||
                activeDateOf == null) {
              activeDateOf = element.dateTime;
              activeDateLengthOf = elementModels.length;
            }
          }

          DateTime? activeDateOfWeek;
          int activeDateLengthOfWeek = 0;
          DateTime? mostBetsWonOnWeek;
          DateTime? mostBetsLostOnWeek;
          int mostBetsWonOnWeekValue = 0;
          int mostBetsLostOnWeekValue = 0;

          for (var element in dateTimes) {
            List<BetModel> elementModels =
                betModels.where((e) => e.dateTime.onlyDate == element).toList();

            _Model model = _Model(date: element, count: elementModels.length);

            if (elementModels.where((element) => element.isWin).length >
                    mostBetsWonOnWeekValue ||
                mostBetsWonOnWeek == null) {
              mostBetsWonOnWeek = element;
              mostBetsWonOnWeekValue =
                  elementModels.where((element) => element.isWin).length;
            }

            if (elementModels.where((element) => !element.isWin).length <=
                    mostBetsLostOnWeekValue ||
                mostBetsLostOnWeek == null) {
              mostBetsLostOnWeek = element;
              mostBetsLostOnWeekValue =
                  elementModels.where((element) => element.isWin).length;
            }

            if (model.count > activeDateLengthOfWeek ||
                activeDateOfWeek == null) {
              activeDateOfWeek = element;
              activeDateLengthOfWeek = model.count;
            }

            models.add(model);
          }

          return SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(kDefaultPadding),
                  child: Row(
                    children: [
                      Expanded(
                          child: Text(
                              '${value.day}${value.day > dateTimes.last.day ? ' ${DateFormat('MMMM').format(value)}' : ''}'
                              '-${dateTimes.last.day} '
                              '${DateFormat('MMMM yyyy').format(value.copyWith(month: value.day > dateTimes.last.day ? value.month + 1 : value.month))}')),
                      ClickArea(
                          onTap: () {
                            date.value =
                                value.subtract(const Duration(days: 7));

                          },
                          child: const Icon(Icons.arrow_back_ios_rounded)),
                      ClickArea(
                          onTap: () {
                            date.value =
                                value.subtract(const Duration(days: -7));
                          },
                          child: const Icon(Icons.arrow_forward_ios_outlined)),
                    ],
                  ),
                ),
                const Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.only(right: kDefaultPadding),
                      child: Text(
                        'Bets Amount',
                        style: TextStyle(fontSize: 13),
                      ),
                    )),
                SizedBox(
                    height: 200,
                    child: Padding(
                      padding: const EdgeInsets.all(kDefaultPadding),
                      child: BarChart(BarChartData(
                        barGroups: models
                            .map((e) => BarChartGroupData(
                                  x: e.date.day,
                                  barRods: [
                                    BarChartRodData(
                                        toY: e.count.toDouble(),
                                        borderRadius: BorderRadius.zero,
                                        color: kAccentColor),
                                  ],
                                ))
                            .toList(),
                        titlesData: FlTitlesData(
                            show: true,
                            topTitles: const AxisTitles(),
                            rightTitles: const AxisTitles(),
                            leftTitles: AxisTitles(
                                sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: (value, meta) {
                                if (value == value.roundToDouble()) {
                                  return Text(value.toInt().toString());
                                }
                                return const SizedBox();
                              },
                            )),
                            bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                getTitlesWidget: (value, meta) {
                                  return Text(
                                    '${value.toInt()}',
                                    style: const TextStyle(
                                        color:
                                            Color.fromRGBO(241, 230, 244, 1)),
                                  );
                                },
                              ),
                            )),
                        gridData: const FlGridData(
                          show: true,
                          drawVerticalLine: false,
                        ),
                      )),
                    )),
                _Element(
                    name: 'Most Active Day Of Week',
                    value: DateFormat('dd MMMM').format(activeDateOfWeek!)),
                _Element(
                    name: 'Most Active Day Of All Time',
                    value: DateFormat('dd MMMM').format(activeDateOf!)),
                _Element(
                    name: 'Most Bets Won Of All Time',
                    value: DateFormat('dd MMMM').format(mostBetsWonOn!)),
                _Element(
                    name: 'Most Bets Lost Of All Time',
                    value: DateFormat('dd MMMM').format(mostBetsLostOn!)),
                _Element(
                    name: 'Most Bets Won',
                    value: DateFormat('dd MMMM').format(mostBetsWonOnWeek!)),
                _Element(
                    name: 'Most Bets Lost',
                    value: DateFormat('dd MMMM').format(mostBetsLostOnWeek!)),
              ],
            ),
          );
        });
  }
}

class _Model {
  final DateTime date;
  final int count;

  _Model({required this.date, required this.count});
}

class _Element extends StatelessWidget {
  final String name;
  final String value;

  const _Element({Key? key, required this.name, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: Row(
            children: [
              Expanded(
                  child: Text(name,
                      style: const TextStyle(fontWeight: FontWeight.w600))),
              Text(value,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.secondary)),
            ],
          ),
        ),
        Divider(
            height: 0,
            color: Theme.of(context).colorScheme.secondary.withOpacity(0.25)),
      ],
    );
  }
}
