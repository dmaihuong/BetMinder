import 'package:bet_minder/data/assets.dart';
import 'package:bet_minder/data/styles.dart';
import 'package:bet_minder/main.dart';
import 'package:bet_minder/ui/widgets/buttons/click_area.dart';
import 'package:bet_minder/ui/widgets/buttons/continue.dart';
import 'package:bet_minder/ui/widgets/premium.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'limit_settings.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ModelController modelController = context.watch<ModelController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('App Settings'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Column(
          children: [
            _Element(
              text: 'Privacy Policy',
              icon: DAssetIcons.privacy,
              onTap: policyPr,
            ),
            _Element(
              text: 'Terms of Use',
              onTap: usePr,
              icon: DAssetIcons.terms,
            ),
            if (!modelController.isPremium)
              _Element(
                text: 'Mange Subscription',
                icon: DAssetIcons.subscribe,
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => const PremiumScreen(),
                        fullscreenDialog: true),
                  );
                },
              ),
            _Element(
              text: 'Editing Limits',
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) => Scaffold(
                          backgroundColor: Colors.black38,
                          body: Padding(
                            padding: const EdgeInsets.all(kDefaultPadding),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Are you sure changing the limit of the betting expenses',
                                  style: TextStyle(
                                      color: kWhiteText,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: kDefaultPadding * 1.5),
                                DContinueButton(
                                    onTap: () {
                                      Navigator.pop(context);
                                      Navigator.push(
                                          context,
                                          CupertinoPageRoute(
                                              builder: (context) =>
                                                  const LimitSettings()));
                                    },
                                    name: 'Confirm'),
                                const SizedBox(height: kDefaultPadding),
                                DContinueButton(
                                  onTap: () {
                                    Navigator.maybePop(context);
                                  },
                                  name: 'Not Now',
                                  type: DContinueButtonColorType.grey,
                                )
                              ],
                            ),
                          ),
                        ));
              },
              icon: DAssetIcons.limitTracker,
            ),
          ],
        ),
      ),
    );
  }
}

class _Element extends StatelessWidget {
  final String icon;
  final String text;
  final VoidCallback? onTap;

  const _Element({Key? key, required this.icon, required this.text, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: kDefaultPadding * 0.75),
      child: ClickArea(
        onTap: () {
          if (onTap != null) {
            onTap!();
          }
        },
        child: Container(
          padding: const EdgeInsets.symmetric(
              horizontal: kDefaultPadding, vertical: kDefaultPadding * 0.75),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: kBorderRadius,
          ),
          child: Row(
            children: [
              SvgPicture.asset(icon),
              const SizedBox(width: kDefaultPadding / 2),
              Expanded(
                child: Text(text, style: const TextStyle(color: kWhiteText)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
