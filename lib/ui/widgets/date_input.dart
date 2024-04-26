import 'package:bet_minder/data/assets.dart';
import 'package:bet_minder/ui/widgets/extentions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../data/styles.dart';
import 'buttons/click_area.dart';

class DDateInput extends StatelessWidget {
  final String title;
  final ValueNotifier<DateTime?> controller;

  const DDateInput({
    Key? key,
    required this.title,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: kDefaultPadding / 2),
          child:
              Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
        ),
        ClickArea(
          onTap: () async {
            _showDialog(
                context,
                Column(
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: CupertinoButton(
                        child: const Text('Done'),
                        onPressed: () {
                          controller.value ??= DateTime.now().onlyDate;
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Expanded(
                      child: CupertinoDatePicker(
                          initialDateTime:
                              controller.value ?? DateTime.now().onlyDate,
                          mode: CupertinoDatePickerMode.date,
                          maximumDate: DateTime.now().onlyDate,
                          showDayOfWeek: false,
                          onDateTimeChanged: (DateTime newDate) {
                            controller.value = newDate.onlyDate;
                          }),
                    ),
                  ],
                ));
          },
          child: Container(
              padding: const EdgeInsets.all(kDefaultPadding * 0.75),
              decoration: const BoxDecoration(
                  borderRadius: kBorderRadius, color: kWhiteText),
              child: ValueListenableBuilder(
                  valueListenable: controller,
                  builder: (context, value, _) {
                    return Row(
                      children: [
                        Expanded(
                          child: Text(
                            value == null
                                ? 'Date'
                                : DateFormat('dd.MM.yyyy').format(value),
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: value == null ? kGreyColor : null),
                          ),
                        ),
                        SvgPicture.asset(
                          DAssetIcons.eventCalendar,
                          colorFilter: ColorFilter.mode(
                              Theme.of(context).colorScheme.secondary,
                              BlendMode.srcIn),
                        ),
                      ],
                    );
                  })),
        ),
      ],
    );
  }

  Future<void> _showDialog(BuildContext context, Widget child) async {
    return await showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );
  }
}
