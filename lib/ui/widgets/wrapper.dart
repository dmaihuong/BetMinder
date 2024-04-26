
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data/styles.dart';

class ElementWrapper extends StatelessWidget {
  final String title;
  final Widget child;

  const ElementWrapper({Key? key, required this.title, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: kBorderRadius),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: kAccentColor,
                  fontWeight: FontWeight.w500,
                  height: 1.1)),
          const SizedBox(height: kDefaultPadding / 2),
          child
        ],
      ),
    );
  }
}
