import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../data/styles.dart';

class DTextInput extends StatelessWidget {
  final String? title;
  final String? hintText;
  final bool isNumber;
  final bool isDouble;
  final TextEditingController controller;

  const DTextInput(
      {Key? key,
      this.title,
      required this.controller,
      this.isNumber = true,
      this.hintText,
      this.isDouble = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Padding(
            padding: const EdgeInsets.only(bottom: kDefaultPadding / 2),
            child: Text(title!,
                style: const TextStyle(fontWeight: FontWeight.w700)),
          ),
        Container(
          decoration: BoxDecoration(
              borderRadius: kBorderRadius,
              color: Theme.of(context).colorScheme.surface),
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: TextFormField(
            controller: controller,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
                icon: isNumber
                    ? const Text('\$ ', style: TextStyle(color: kAccentColor))
                    : null,
                hintStyle: const TextStyle(
                    color: kGreyColor, fontWeight: FontWeight.w400)),
            keyboardType: isNumber
                ? TextInputType.number
                : isDouble
                    ? const TextInputType.numberWithOptions(decimal: true)
                    : TextInputType.text,
            inputFormatters: isNumber
                ? [FilteringTextInputFormatter.digitsOnly]
                : isDouble
                    ? [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^\d+\,?\d{0,2}')),
                      ]
                    : null,
          ),
        ),
      ],
    );
  }
}
