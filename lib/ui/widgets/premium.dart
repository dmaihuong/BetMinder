import 'package:apphud/apphud.dart';
import 'package:apphud/models/apphud_models/apphud_product.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:bet_minder/ui/screens/welcome/screen.dart';
import 'package:bet_minder/ui/widgets/buttons/continue.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../data/assets.dart';
import '../../data/styles.dart';
import '../../main.dart';

import '../screens/app_screen.dart';
import 'buttons/click_area.dart';

const premiumID = 'minder_premium';
late ApphudProduct premiumProduct;
late String premiumPrice;

class PremiumScreen extends StatelessWidget {
  const PremiumScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ModelController modelController = context.read<ModelController>();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Center(
                  child: Image.asset(DAssetImages.premium),
                ),
              ),
              AutoSizeText.rich(
                TextSpan(
                  text: 'Unlock the full functionality of the app for ',
                  style: Theme.of(context).textTheme.titleMedium,
                  children: [
                    TextSpan(
                      text: '$premiumPrice/month',
                      style: TextStyle(color: kAccentColor),
                    )
                  ],
                ),
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: kDefaultPadding),
              AutoSizeText(
                'Get full access to analytics as well as more sports in the events calendar',
                textAlign: TextAlign.center,
                maxLines: 2,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(height: kDefaultPadding),
              DContinueButton(
                  onTap: () async {
                    final buyPremium =
                        await Apphud.purchase(product: premiumProduct);
                    if (kDebugMode ||
                        (buyPremium.nonRenewingPurchase?.isActive ?? false)) {
                      premiumController.sink
                          .add(modelController.copyWith(isPremium: true));
                      _close(context);
                    }
                  },
                  name: 'Buy now'),
              const SizedBox(height: kDefaultPadding),
              DContinueButton(
                onTap: () {
                  _close(context);
                },
                name: 'Maybe Later',
                type: DContinueButtonColorType.grey,
              ),
              const SizedBox(height: kDefaultPadding),
              SizedBox(
                height: 50,
                child: Row(
                  children: [
                    Expanded(
                        child: GestureDetector(
                      onTap: usePr,
                      behavior: HitTestBehavior.opaque,
                      child: Center(
                          child: Opacity(
                              opacity: 0.7,
                              child: Text(
                                'Terms of Use',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w400, fontSize: 15),
                              ))),
                    )),
                    Expanded(
                        child: GestureDetector(
                      onTap: () async {
                        final restorePressed = await Apphud.restorePurchases();
                        if (kDebugMode ||
                            (restorePressed.purchases
                                .map((e) => e.isActive)
                                .contains(true))) {
                          premiumController.sink
                              .add(modelController.copyWith(isPremium: true));
                          _close(context);
                        }
                      },
                      behavior: HitTestBehavior.opaque,
                      child: Center(
                          child: Opacity(
                              opacity: 0.7,
                              child: Text(
                                'Restore',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w400, fontSize: 15),
                              ))),
                    )),
                    Expanded(
                        child: GestureDetector(
                      onTap: policyPr,
                      behavior: HitTestBehavior.opaque,
                      child: Center(
                          child: Opacity(
                              opacity: 0.7,
                              child: Text(
                                'Privacy Policy',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w400, fontSize: 15),
                              ))),
                    )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _close(BuildContext context) {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    } else {
      ModelController modelController = context.read<ModelController>();
      if (modelController.model == null) {
        Navigator.pushReplacement(context,
            CupertinoPageRoute(builder: (context) => const WelcomeScreen()));
      } else {
        Navigator.pushReplacement(context,
            CupertinoPageRoute(builder: (context) => const AppScreen()));
      }
    }
  }
}

class _Element extends StatelessWidget {
  final String icon;
  final String text;
  final String accentText;

  const _Element(
      {Key? key,
      required this.icon,
      required this.text,
      required this.accentText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: kBorderRadius,
          color: Theme.of(context).colorScheme.surface),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        children: [
          SvgPicture.asset(icon),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText.rich(
                  TextSpan(text: '$text\n', children: [
                    TextSpan(
                      text: accentText,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.secondary),
                    )
                  ]),
                  style: const TextStyle(fontSize: 24, height: 1.4),
                  maxLines: 2,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
