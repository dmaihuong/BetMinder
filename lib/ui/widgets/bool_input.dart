import 'package:flutter/material.dart';

import '../../data/styles.dart';
import 'buttons/click_area.dart';

class DBoolInput extends StatelessWidget {
  final String? title;
  final ValueNotifier<bool> controller;

  const DBoolInput({Key? key, this.title, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      if (title != null)
        Padding(
          padding: const EdgeInsets.only(bottom: kDefaultPadding / 2),
          child:
              Text(title!, style: const TextStyle(fontWeight: FontWeight.w700)),
        ),
      Container(
        decoration: BoxDecoration(
            borderRadius: kBorderRadius,
            color: Theme.of(context).colorScheme.surface),
        padding: const EdgeInsets.symmetric(
            vertical: kDefaultPadding * 0.75, horizontal: kDefaultPadding),
        child: ValueListenableBuilder(
          valueListenable: controller,
          builder: (context, value, child) {
            return Column(
              children: [
                ClickArea(
                  onTap: () {
                    controller.value = true;
                  },
                  child: Row(
                    children: [
                      const Expanded(child: Text('Won')),
                      Container(
                        height: 24,
                        width: 24,
                        decoration: BoxDecoration(
                            color: value
                                ? Theme.of(context).colorScheme.secondary
                                : Theme.of(context).colorScheme.surface,
                            border: Border.all(
                                color: Theme.of(context)
                                    .colorScheme
                                    .secondary),
                            shape: BoxShape.circle),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: kDefaultPadding ),
                ClickArea(
                  onTap: () {
                    controller.value = false;
                  },
                  child: Row(
                    children: [
                      const Expanded(child: Text('Lost')),
                      Container(
                        height: 24,
                        width: 24,
                        decoration: BoxDecoration(
                            color: !value
                                ? Theme.of(context).colorScheme.secondary
                                : Theme.of(context).colorScheme.surface,
                            border: Border.all(
                                color: Theme.of(context)
                                    .colorScheme
                                    .secondary),
                            shape: BoxShape.circle),
                      )
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    ]);
  }
}
