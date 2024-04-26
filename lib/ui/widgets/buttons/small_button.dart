import 'package:flutter/material.dart';
import '../../../data/styles.dart';
import 'click_area.dart';

class DSmallButton extends StatelessWidget {
  final String name;
  final VoidCallback onTap;

  const DSmallButton({Key? key, required this.name, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClickArea(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(17)),
            color: kWhiteText),
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Text(name,
              textAlign: TextAlign.center,
              style: const TextStyle(color: kPromptTextColor, height: 1.25)),
        ),
      ),
    );
  }
}
