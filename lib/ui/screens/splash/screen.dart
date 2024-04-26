import 'package:apphud/apphud.dart';
import 'package:apphud/models/apphud_models/apphud_paywall.dart';
import 'package:apphud/models/apphud_models/apphud_product.dart';
import 'package:bet_minder/data/styles.dart';
import 'package:bet_minder/main.dart';
import 'package:bet_minder/ui/screens/app_screen.dart';
import 'package:bet_minder/ui/screens/welcome/screen.dart';
import 'package:bet_minder/ui/widgets/premium.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final prems = await Apphud.paywallsDidLoadCallback();
      for (ApphudPaywall premPaywalls in prems.paywalls) {
        for (ApphudProduct premProd in premPaywalls.products ?? []) {
          if (premProd.productId == premiumID) {
            premiumProduct = premProd;
          }
        }
      }
      final formatter = NumberFormat.currency(
          symbol: premiumProduct.skProduct?.priceLocale.currencySymbol ?? '\$');
      premiumPrice = formatter.format(premiumProduct.skProduct?.price ?? 1.49);

      final premiumValue = await Apphud.hasPremiumAccess();

      ModelController modelController = context.read<ModelController>();
      premiumController.sink
          .add(modelController.copyWith(isPremium: premiumValue));

      if (!premiumValue) {
        Navigator.pushReplacement(
            context,
            PageRouteBuilder(
                transitionDuration: Duration(),
                pageBuilder: (context, _, __) => PremiumScreen()));
      } else {
        if (modelController.model == null) {
          Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                  transitionDuration: Duration(),
                  pageBuilder: (context, _, __) => WelcomeScreen()));
        } else {
          Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                  transitionDuration: Duration(),
                  pageBuilder: (context, _, __) => AppScreen()));
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return WidgetsApp(
      debugShowCheckedModeBanner: false,
      color: kLightBackgroundColor,
      builder: (context, child) {
        return const Scaffold(
          backgroundColor: kLightBackgroundColor,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [],
            ),
          ),
        );
      },
    );
  }
}
