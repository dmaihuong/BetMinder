import 'package:auto_size_text/auto_size_text.dart';
import 'package:bet_minder/data/assets.dart';
import 'package:bet_minder/data/styles.dart';
import 'package:bet_minder/models/purposeful_reading.dart';
import 'package:bet_minder/ui/widgets/buttons/click_area.dart';
import 'package:flutter/material.dart';

class PRInitView extends StatelessWidget {
  final Function(PurposefulReadingModel model) onTap;

  const PRInitView({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Image.asset(DAssetImages.purposefulReading),
          Padding(
            padding: const EdgeInsets.all(kDefaultPadding).copyWith(bottom: 0),
            child: Column(
              children: [
                AutoSizeText(
                  'Here you can find information to help\nyou with your bets',
                  maxLines: 2,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(height: kDefaultPadding * 1.5),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: purposefulReadingModels.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: kDefaultPadding),
                      child: ClickArea(
                        onTap: () => onTap(purposefulReadingModels[index]),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.secondary,
                              borderRadius: kBorderRadius),
                          padding: const EdgeInsets.all(kDefaultPadding),
                          child: Text(
                            purposefulReadingModels[index].name,
                            style: const TextStyle(
                                fontWeight: FontWeight.w600, color: kWhiteText),
                          ),
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
