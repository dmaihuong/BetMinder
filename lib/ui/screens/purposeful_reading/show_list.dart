import 'package:bet_minder/data/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../models/purposeful_reading.dart';

class PRShowListView extends StatelessWidget {
  final PurposefulReadingModel model;

  const PRShowListView({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(kDefaultPadding),
      itemCount: model.models.length,
      itemBuilder: (context, index) {
        PurposefulReadingBodyModel item = model.models[index];

        if (item is PRText) {
          return Padding(
            padding: const EdgeInsets.only(bottom: kDefaultPadding),
            child: Text(item.text,
              style: TextStyle(fontWeight: FontWeight.w400),),
          );
        } else if (item is PRTitle) {
          return Padding(
            padding: const EdgeInsets.only(bottom: kDefaultPadding, top: 4),
            child: Text(
              item.text,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          );
        } else if (item is PRMarkerText) {
          return Padding(
            padding: const EdgeInsets.only(bottom: kDefaultPadding),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('   • '),
                Expanded(child: Text(item.text,
                  style: TextStyle(fontWeight: FontWeight.w400),)),
              ],
            ),
          );
        } else if (item is PRImage) {
          return Padding(
            padding: const EdgeInsets.only(bottom: kDefaultPadding),
            child: Image.asset(item.imageSrc, scale: 3),
          );
        } else if (item is PRTable) {
          return Padding(
            padding: const EdgeInsets.only(bottom: kDefaultPadding),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: Text(
                  item.name,
                  style: TextStyle(fontWeight: FontWeight.w600),
                )),
                const SizedBox(width: kDefaultPadding / 2),
                Expanded(
                    flex: 2,
                    child: Text(
                      item.value,
                      style: TextStyle(fontWeight: FontWeight.w400),
                    )),
              ],
            ),
          );
        }

        return const SizedBox();
      },
    );
  }
}
