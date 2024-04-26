import 'package:bet_minder/main.dart';
import 'package:bet_minder/models/bet_model.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../data/styles.dart';

class BAResultView extends StatelessWidget {
  const BAResultView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<BetModel> models = dbController.betModelController.getModels();

    int winPercent = ((models.where((element) => element.isWin == true).length /
                models.length) *
            100)
        .toInt();
    int loosePercent = 100 - winPercent;

    late SportBetType popularType;
    double popularTypeValue = 0;

    SportBetType? unPopularType;
    double unPopularTypeValue = 0;

    for (SportBetType e in SportBetType.values) {
      double value =
          models.where((element) => element.typeOfSport == e).length /
              models.length;
      if (value <= unPopularTypeValue || unPopularTypeValue == null) {
        unPopularTypeValue = value;
        unPopularType = e;
      }

      if (value > popularTypeValue) {
        popularTypeValue = value;
        popularType = e;
      }
    }

    double totalProfit = 0;

    for (var element in models) {
      totalProfit +=
          element.amount * element.bettingOdds * (element.isWin ? 1 : -1);
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 300,
            child: PieChart(
              PieChartData(
                pieTouchData: PieTouchData(
                  touchCallback: (FlTouchEvent event, pieTouchResponse) {},
                ),
                borderData: FlBorderData(show: false),
                sectionsSpace: 0,
                centerSpaceRadius: 40,
                sections: [
                  PieChartSectionData(
                      value: winPercent.toDouble(),
                      title: '$winPercent%',
                      titleStyle: const TextStyle(
                          color: kWhiteText,
                          fontSize: 14,
                          fontWeight: FontWeight.w700),
                      color: kAccentColor,
                      radius: 90),
                  PieChartSectionData(
                      value: loosePercent.toDouble(),
                      title: '$loosePercent%',
                      titleStyle: const TextStyle(
                          color: kWhiteText,
                          fontSize: 14,
                          fontWeight: FontWeight.w700),
                      color: const Color.fromRGBO(38, 34, 157, 1),
                      radius: 80),
                ],
              ),
            ),
          ),
          const SizedBox(height: kDefaultPadding),
          _Element(
            value: '$winPercent%',
            name: 'Win',
          ),
          _Element(
            value: '$loosePercent%',
            name: 'Lost',
          ),
          _Element(
            value: popularType.nameString,
            name: 'The most profitable type',
          ),
          _Element(
            value: (unPopularType ?? SportBetType.baseball).nameString,
            name: 'The most unprofitable type',
          ),
          _Element(
            value:
                '${totalProfit.isNegative ? '-' : '+'}\$ ${totalProfit.toInt().abs()}',
            name: 'Most Bets Won',
          ),
        ],
      ),
    );
  }
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
