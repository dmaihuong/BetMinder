import 'package:bet_minder/main.dart';
import 'package:bet_minder/ui/screens/app_screen.dart';
import 'package:bet_minder/ui/screens/settings/limit_settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../../data/assets.dart';
import '../../../data/styles.dart';
import '../../widgets/buttons/continue.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: Column(
            children: [
              Expanded(
                child: Image.asset(DAssetImages.welcome),
              ),
              const SizedBox(height: kDefaultPadding * 2),
              Text(
                'First, you need to set rate limits for each period.',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.w600, height: 1.2),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: kDefaultPadding * 2),
              DContinueButton(
                  onTap: () {

                      Navigator.pushReplacement(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => const LimitSettings()));

                  },
                  name: "Start Now"),
            ],
          ),
        ),
      ),
    );
  }
}
