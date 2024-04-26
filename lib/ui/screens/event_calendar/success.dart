import 'package:auto_size_text/auto_size_text.dart';
import 'package:bet_minder/data/styles.dart';
import 'package:bet_minder/models/bet_model.dart';
import 'package:bet_minder/ui/screens/event_calendar/bloc/state.dart';
import 'package:bet_minder/ui/widgets/extentions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../models/calendar_model.dart';
import 'bloc/bloc.dart';
import 'bloc/event.dart';

class ECSuccessView extends StatelessWidget {
  const ECSuccessView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ECBloc>(builder: (context, bloc, _) {
      return StreamBuilder<ECSuccess>(
        stream: bloc.successStream,
        initialData: bloc.successState,
        builder: (context, snapshot) {
          ECSuccess state = snapshot.data!;
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () => bloc.sink.add(ECCLoseView()),
                icon: const Icon(CupertinoIcons.back),
              ),
              title: Text(state.type.nameString),
            ),
            body: Builder(
              builder: (context) {
                if (state.models != null) {
                  if (state.models!.length == 0) {
                    return Center(
                      child: Text(
                        'No events today',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: state.models!.length,
                      padding: const EdgeInsets.all(kDefaultPadding),
                      itemBuilder: (context, index) {
                        EventCalendarModel model = state.models![index];
                        return Container(
                          margin:
                              const EdgeInsets.only(bottom: kDefaultPadding),
                          decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.secondary,
                              borderRadius: kBorderRadius),
                          padding: const EdgeInsets.symmetric(
                              vertical: kDefaultPadding * 0.75,
                              horizontal: kDefaultPadding / 4),
                          child: Column(
                            children: [
                              Text(
                                model.leagueName,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.copyWith(color: kWhiteText),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: kDefaultPadding),
                              Row(
                                children: [
                                  Expanded(
                                      flex: 3,
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 35,
                                            width: 35,
                                            decoration: const BoxDecoration(
                                                color: kWhiteText,
                                                shape: BoxShape.circle),
                                            child: Center(
                                                child: Text(
                                              model.firstCommandName[0] == ' '
                                                  ? model.firstCommandName[1]
                                                  : model.firstCommandName[0],
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .secondary,
                                                  fontSize: 19,
                                                  fontWeight: FontWeight.w900),
                                            )),
                                          ),
                                          const SizedBox(
                                              height: kDefaultPadding / 2),
                                          Text(
                                            model.firstCommandName,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                color: kWhiteText),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      )),
                                  const SizedBox(width: kDefaultPadding / 4),
                                  Expanded(
                                    flex: 2,
                                    child: Column(
                                      children: [
                                        AutoSizeText(
                                          DateFormat('dd/MM/yyy')
                                              .format(DateTime.now().onlyDate),
                                          maxLines: 1,
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                              color: kWhiteText),
                                        ),
                                        AutoSizeText(
                                          model.time,
                                          maxLines: 1,
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                              color: kWhiteText),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: kDefaultPadding / 4),
                                  Expanded(
                                      flex: 3,
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 35,
                                            width: 35,
                                            decoration: const BoxDecoration(
                                                color: kWhiteText,
                                                shape: BoxShape.circle),
                                            child: Center(
                                                child: Text(
                                              model.secondCommandName[0] == ' '
                                                  ? model.secondCommandName[1]
                                                  : model.secondCommandName[0],
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .secondary,
                                                  fontSize: 19,
                                                  fontWeight: FontWeight.w900),
                                            )),
                                          ),
                                          const SizedBox(
                                              height: kDefaultPadding / 2),
                                          Text(
                                            model.secondCommandName,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                color: kWhiteText),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      )),
                                ],
                              )
                            ],
                          ),
                        );
                      },
                    );
                  }
                }

                return const Center(child: CupertinoActivityIndicator());
              },
            ),
          );
        },
      );
    });
  }
}
