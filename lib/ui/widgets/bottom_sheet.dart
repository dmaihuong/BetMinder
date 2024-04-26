import 'package:flutter/material.dart';

import '../../data/styles.dart';

void showCustomBottomSheet(
    {required BuildContext context, required Widget child, double? maxSize}) {
  showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) => Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24), topRight: Radius.circular(24)),
              border: Border(top: BorderSide(color: Colors.white24))),
          constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height * 0.2,
              maxHeight: maxSize != null
                  ? MediaQuery.of(context).size.height * (maxSize)
                  : double.infinity),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(24), topRight: Radius.circular(24)),
            child: SafeArea(
                top: false,
                left: false,
                right: false,
                child: Padding(
                  padding: const EdgeInsets.all(kDefaultPadding),
                  child: child,
                )),
          )));
}
