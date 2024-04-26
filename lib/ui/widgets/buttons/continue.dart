import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../data/styles.dart';

enum DContinueButtonColorType { accent, grey }

class DContinueButton extends StatelessWidget {
  final VoidCallback onTap;

  final String name;
  final DContinueButtonColorType type;
  final bool? loading;
  final double? padding;
  final double? horizontalPadding;
  final double? radius;
  final double? fontSize;
  final FontWeight? fontWeight;

  const DContinueButton(
      {Key? key,
      required this.onTap,
      required this.name,
      this.padding,
      this.horizontalPadding,
      this.loading,
      this.type = DContinueButtonColorType.accent,
      this.radius,
      this.fontSize,
      this.fontWeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        onTap: onTap,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(radius ?? 8)),
            color: type == DContinueButtonColorType.accent
                ? Theme.of(context).colorScheme.secondary
                : type == DContinueButtonColorType.grey
                    ? kGreyLightCardColor
                    : kWhiteText,
          ),
          padding: EdgeInsets.symmetric(
              vertical: padding ?? 11,
              horizontal: horizontalPadding ?? padding ?? 50),
          child: Text(name,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontSize: fontSize ?? 16,
                  fontWeight: fontWeight ?? FontWeight.w600,
                  color: kWhiteText)),
        ),
      ),
    );
  }
}
