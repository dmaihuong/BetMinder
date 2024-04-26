import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../data/styles.dart';
import '../../../widgets/buttons/click_area.dart';
import '../bloc/bloc.dart';
import '../bloc/event.dart';
import '../bloc/state.dart';

class DATapBar extends StatelessWidget {
  final BAType value;

  const DATapBar({Key? key, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      decoration: BoxDecoration(
          color: kGreyColor.withOpacity(0.3), borderRadius: kBorderRadius),
      padding: const EdgeInsets.all(2),
      child: Consumer<BABloc>(builder: (context, bloc, _) {
        return Row(
          children: [
            Expanded(
              child: ClickArea(
                onTap: () => bloc.sink.add(BASelectType(BAType.sportType)),
                child: Container(
                  decoration: BoxDecoration(
                      color: value == BAType.sportType
                          ? Theme.of(context).colorScheme.secondary
                          : null,
                      borderRadius: kBorderRadius),
                  child: Center(
                    child: Text(
                      'Sport Type',
                      style: TextStyle(
                          fontWeight: value == BAType.sportType
                              ? null
                              : FontWeight.w400,
                          fontSize: 13,
                          color: value == BAType.sportType
                              ? kWhiteText
                              : Theme.of(context).colorScheme.secondary),
                    ),
                  ),
                ),
              ),
            ),
            if (value == BAType.date)
              const VerticalDivider(
                indent: 5,
                endIndent: 5,
                width: 0,
              ),
            Expanded(
              child: ClickArea(
                onTap: () => bloc.sink.add(BASelectType(BAType.result)),
                child: Container(
                  decoration: BoxDecoration(
                      color: value == BAType.result
                          ? Theme.of(context).colorScheme.secondary
                          : null,
                      borderRadius: kBorderRadius),
                  child: Center(
                    child: Text(
                      'Result',
                      style: TextStyle(
                          fontWeight:
                              value == BAType.result ? null : FontWeight.w400,
                          fontSize: 13,
                          color: value == BAType.result
                              ? kWhiteText
                              : Theme.of(context).colorScheme.secondary),
                    ),
                  ),
                ),
              ),
            ),
            if (value == BAType.sportType)
              const VerticalDivider(
                indent: 5,
                endIndent: 5,
                width: 0,
              ),
            Expanded(
              child: ClickArea(
                onTap: () => bloc.sink.add(BASelectType(BAType.date)),
                child: Container(
                  decoration: BoxDecoration(
                      color: value == BAType.date
                          ? Theme.of(context).colorScheme.secondary
                          : null,
                      borderRadius: kBorderRadius),
                  child: Center(
                    child: Text(
                      'Date',
                      style: TextStyle(
                          color: value == BAType.date
                              ? kWhiteText
                              : Theme.of(context).colorScheme.secondary,
                          fontSize: 13,
                          fontWeight:
                              value == BAType.date ? null : FontWeight.w400),
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
