import 'dart:ui';

import 'package:bet_minder/data/assets.dart';
import 'package:bet_minder/models/bet_model.dart';
import 'package:bet_minder/ui/widgets/buttons/click_area.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../data/styles.dart';

class DSelectInput extends StatefulWidget {
  final String? title;
  final ValueNotifier<SportBetType?> controller;

  const DSelectInput({Key? key, this.title, required this.controller})
      : super(key: key);

  @override
  State<DSelectInput> createState() => _DSelectInputState();
}

class _DSelectInputState extends State<DSelectInput> {
  late ValueNotifier<bool> isShow;

  @override
  void initState() {
    isShow = ValueNotifier(false);
    super.initState();
  }

  @override
  void dispose() {
    isShow.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title != null)
          Padding(
            padding: const EdgeInsets.only(bottom: kDefaultPadding / 2),
            child: Text(widget.title!,
                style: const TextStyle(fontWeight: FontWeight.w700)),
          ),
        Container(
          decoration: BoxDecoration(
              borderRadius: kBorderRadius,
              color: Theme.of(context).colorScheme.surface),
          padding: const EdgeInsets.symmetric(
              vertical: kDefaultPadding * 0.75, horizontal: kDefaultPadding),
          child: ValueListenableBuilder<SportBetType?>(
              valueListenable: widget.controller,
              builder: (context, selectedValue, _) {
                return ValueListenableBuilder<bool>(
                    valueListenable: isShow,
                    builder: (context, value, _) {
                      return Column(
                        children: [
                          ClickArea(
                            onTap: () {
                              isShow.value = !value;
                              FocusScope.of(context).unfocus();
                            },
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    selectedValue != null
                                        ? selectedValue.nameString
                                        : 'Type',
                                    style: TextStyle(
                                        color: selectedValue != null
                                            ? null
                                            : kGreyColor,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                SvgPicture.asset(DAssetIcons.bottomArrow)
                              ],
                            ),
                          ),
                          if (value)
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: kDefaultPadding),
                              child: Column(
                                children: SportBetType.values
                                    .map((e) => ClickArea(
                                          onTap: () {
                                            widget.controller.value = e;
                                            isShow.value = false;
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                bottom:
                                                    SportBetType.values.last ==
                                                            e
                                                        ? 0
                                                        : kDefaultPadding),
                                            child: Row(
                                              children: [
                                                Expanded(child: Text(e.nameString)),
                                                Container(
                                                  height: 24,
                                                  width: 24,
                                                  decoration: BoxDecoration(
                                                      color: selectedValue == e
                                                          ? Theme.of(context)
                                                              .colorScheme
                                                              .secondary
                                                          : Theme.of(context)
                                                              .colorScheme
                                                              .surface,
                                                      border: Border.all(
                                                          color:
                                                              Theme.of(context)
                                                                  .colorScheme
                                                                  .secondary),
                                                      shape: BoxShape.circle),
                                                )
                                              ],
                                            ),
                                          ),
                                        ))
                                    .toList(),
                              ),
                            )
                        ],
                      );
                    });
              }),
        ),
      ],
    );
  }
}




