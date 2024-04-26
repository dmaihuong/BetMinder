import 'package:bet_minder/data/styles.dart';
import 'package:bet_minder/main.dart';
import 'package:bet_minder/models/bet_model.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BASportTypeView extends StatelessWidget {
  const BASportTypeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<_Model> models = _getModels();

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
                centerSpaceRadius: 50,
                sections: models
                    .map((e) => PieChartSectionData(
                        value: e.percent,
                        title: '${(e.percent * 100).toInt()}%',
                        titleStyle: const TextStyle(
                            color: kWhiteText,
                            fontSize: 14,
                            fontWeight: FontWeight.w700),
                        color: color[e.type.index],
                        radius: sizes[e.type.index] + 20))
                    .toList(),
              ),
            ),
          ),
          ...models.map(
            (e) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(kDefaultPadding),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            e.type.nameString,
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                        Text(
                          '${(e.percent * 100).toInt()}%',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).colorScheme.secondary),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                      height: 0,
                      color: Theme.of(context)
                          .colorScheme
                          .secondary
                          .withOpacity(0.25)),
                ],
              );
            },
          )
        ],
      ),
    );
  }

  List<double> get sizes => const [60, 40, 20, 50, 40, 35, 25, 30];

  List<Color> get color => const [
        Color.fromRGBO(2, 254, 253, 1),
        Color.fromRGBO(38, 34, 157, 1),
        Color.fromRGBO(48, 97, 199, 1),
        Color.fromRGBO(163, 45, 183, 1),
        Color.fromRGBO(109, 82, 227, 1),
        Color.fromRGBO(255, 131, 237, 1),
        Color.fromRGBO(125, 138, 253, 1),
        Color.fromRGBO(2, 254, 253, 1)
      ];

  List<_Model> _getModels() {
    List<_Model> models = [];
    List<BetModel> betModels = dbController.betModelController.getModels();



    for (SportBetType e in SportBetType.values) {
      models.add(
        _Model(
          type: e,
          percent:
              betModels.where((element) => element.typeOfSport == e).length /
                  betModels.length,
        ),
      );
    }

    return models;
  }
}

class _Model {
  final SportBetType type;
  final double percent;

  _Model({required this.type, required this.percent});
}
