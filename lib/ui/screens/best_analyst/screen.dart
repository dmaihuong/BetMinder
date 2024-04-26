import 'package:auto_size_text/auto_size_text.dart';
import 'package:bet_minder/data/assets.dart';
import 'package:bet_minder/data/styles.dart';
import 'package:bet_minder/main.dart';
import 'package:bet_minder/models/bet_model.dart';
import 'package:bet_minder/ui/screens/best_analyst/bloc/state.dart';
import 'package:bet_minder/ui/screens/limit_tracker/add_bet.dart';
import 'package:bet_minder/ui/widgets/buttons/continue.dart';
import 'package:bet_minder/ui/widgets/premium.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/limit_controller.dart';
import 'bloc/bloc.dart';
import 'components/date.dart';
import 'components/result.dart';
import 'components/sport_type.dart';
import 'components/tap_bar.dart';

class BestAnalystScreen extends StatelessWidget {
  const BestAnalystScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ModelController modelController = context.watch<ModelController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bets Analyst'),
      ),
      body: Provider<BABloc>(
        create: (context) => BABloc(),
        dispose: (context, bloc) => bloc.dispose(),
        builder: (context, child) {
          if (!modelController.isPremium) {
            return const _PaidState();
          }

          BABloc bloc = context.read<BABloc>();
          return StreamBuilder<BAState>(
              stream: bloc.stream,
              initialData: bloc.screenState,
              builder: (context, snapshot) {
                BAState state = snapshot.data!;
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(kDefaultPadding),
                      child: DATapBar(value: state.type),
                    ),
                    Expanded(
                      child: StreamBuilder(
                        stream: dbController.betModelController.boxStream(),
                        builder: (context, _) {
                          List<BetModel> models =
                              dbController.betModelController.getModels();

                          if (models.isEmpty) {
                            return Padding(
                              padding: const EdgeInsets.all(kDefaultPadding),
                              child: Column(
                                children: [
                                  Image.asset(
                                    DAssetImages.bestAnalystEmpty,
                                    scale: 3,
                                  ),
                                  const SizedBox(height: kDefaultPadding),
                                  AutoSizeText(
                                    'There are no added bets to analyze. Add them to start analyzing',
                                    style:
                                        Theme.of(context).textTheme.titleSmall,
                                    maxLines: 2,
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            );
                          }

                          if (state.type == BAType.sportType) {
                            return BASportTypeView();
                          } else if (state.type == BAType.result) {
                            return BAResultView();
                          } else if (state.type == BAType.date) {
                            return BADateType();
                          }
                          return const SizedBox();
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(kDefaultPadding),
                      child: StreamBuilder(
                          stream: dbController.betModelController.boxStream(),
                          builder: (context, _) {
                            int sumDay =
                                dbController.betModelController.daySum();
                            LimitControllerModel model = dbController
                                .limitControllerModelController
                                .getLastModel()!;
                            int maxSum = model.dayLimit - sumDay;
                            return DContinueButton(
                                onTap: () {
                                  if (maxSum > 0) {
                                    Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                            builder: (context) =>
                                                AddBet(maxSum: maxSum)));
                                  }
                                },
                                type: maxSum == 0
                                    ? DContinueButtonColorType.grey
                                    : DContinueButtonColorType.accent,
                                name: 'Add bet');
                          }),
                    )
                  ],
                );
              });
        },
      ),
    );
  }
}

class _PaidState extends StatelessWidget {
  const _PaidState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: Column(
        children: [
          Image.asset(DAssetImages.paidAnalyst),
          const SizedBox(height: kDefaultPadding),
          Expanded(
            child: AutoSizeText(
              'Welcome to the Bets Analyst section. Here you can add your data and the diagram will enlighten you about the strategy of your betting history. This feature is available with premium subscription for $premiumPrice/month',
              style: Theme.of(context).textTheme.titleSmall,
              textAlign: TextAlign.center,
              maxLines: 6,
            ),
          ),
          DContinueButton(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (context) => const PremiumScreen(),
                      fullscreenDialog: true),
                );
              },
              name: 'Buy Now')
        ],
      ),
    );
  }
}
