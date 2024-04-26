import 'package:auto_size_text/auto_size_text.dart';
import 'package:bet_minder/data/styles.dart';
import 'package:bet_minder/main.dart';
import 'package:bet_minder/models/bet_model.dart';
import 'package:bet_minder/ui/screens/event_calendar/bloc/bloc.dart';
import 'package:bet_minder/ui/screens/event_calendar/bloc/state.dart';
import 'package:bet_minder/ui/screens/event_calendar/success.dart';
import 'package:bet_minder/ui/widgets/buttons/click_area.dart';
import 'package:bet_minder/ui/widgets/buttons/continue.dart';
import 'package:bet_minder/ui/widgets/premium.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'bloc/event.dart';

class EventCalendarScreen extends StatelessWidget {
  const EventCalendarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ModelController modelController = context.watch<ModelController>();

    return Provider<ECBloc>(
        create: (context) => ECBloc(),
        dispose: (context, bloc) => bloc.dispose(),
        builder: (context, _) {
          ECBloc bloc = context.read<ECBloc>();

          return StreamBuilder<ECState>(
              stream: bloc.stream,
              initialData: bloc.screenState,
              builder: (context, snapshot) {
                ECState? state = snapshot.data;

                if (state is ECSuccess) {
                  return const ECSuccessView();
                }
                return Scaffold(
                  appBar: AppBar(
                    title: const Text('Events сalendar'),
                  ),
                  body: modelController.isPremium
                      ? ListView.builder(
                          padding: const EdgeInsets.all(kDefaultPadding),
                          itemCount: SportBetType.values.length,
                          itemBuilder: (context, index) {
                            return _Element(type: SportBetType.values[index]);
                          },
                        )
                      : const _IsNotPremium(),
                );
              });
        });
  }
}

class _Element extends StatelessWidget {
  final SportBetType type;

  const _Element({Key? key, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: kDefaultPadding),
      child: ClickArea(
        onTap: () {
          ECBloc bloc = context.read<ECBloc>();
          bloc.sink.add(ECSelectedSportType(type));
        },
        child: Container(
          height: 75,
          decoration: BoxDecoration(
              borderRadius: kBorderRadius,
              color: Theme.of(context).colorScheme.secondary),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  child: Text(
                    type.nameString,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: kWhiteText, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              Expanded(child: Image.asset(type.imageSrc)),
            ],
          ),
        ),
      ),
    );
  }
}

class _IsNotPremium extends StatelessWidget {
  const _IsNotPremium({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: Column(
        children: [
          const _Element(type: SportBetType.baseball),
          const _Element(type: SportBetType.football),
          const _Element(type: SportBetType.basketball),
          Expanded(
            child: Center(
              child: AutoSizeText.rich(
                TextSpan(
                  text:
                      'At the moment you have the free version of the app and you only have access to the calendar for 3 sports. Enjoy the most comprehensive event calendar with premium subscription for ',
                  children: [
                    TextSpan(
                        text: '$premiumPrice/month',
                        style: TextStyle(color: kAccentColor))
                  ],
                ),
                style: Theme.of(context).textTheme.titleSmall,
                textAlign: TextAlign.center,
                maxLines: 6,
              ),
            ),
          ),
          DContinueButton(
              onTap: () => Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (context) => const PremiumScreen(),
                      fullscreenDialog: true)),
              name: 'Buy Now')
        ],
      ),
    );
  }
}
