import 'package:bet_minder/ui/screens/purposeful_reading/show_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../models/purposeful_reading.dart';
import 'init.dart';

class PurposefulReadingScreen extends StatefulWidget {
  const PurposefulReadingScreen({Key? key}) : super(key: key);

  @override
  State<PurposefulReadingScreen> createState() =>
      _PurposefulReadingScreenState();
}

class _PurposefulReadingScreenState extends State<PurposefulReadingScreen> {
  late ValueNotifier<PurposefulReadingModel?> selectedModel;

  @override
  void initState() {
    selectedModel = ValueNotifier(null);
    super.initState();
  }

  @override
  void dispose() {
    selectedModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: selectedModel,
        builder: (context, value, _) {
          return Scaffold(
            appBar: AppBar(
              // leading: Builder(
              //   builder: (context) {
              //     if (value != null) {
              //
              //     }
              //     return const SizedBox();
              //   },
              // ),
              // leadingWidth: 100,
              titleSpacing: 0,
              title: value == null
                  ? const Text('Purposeful reading')
                  : SizedBox(
                      width: double.infinity,
                      child: Stack(
                        children: [
                          Positioned(
                              left: 0,
                              top: 0,
                              child: IconButton(
                                  icon: const Icon(CupertinoIcons.back),
                                  onPressed: () => selectedModel.value = null)),
                          Center(
                            child: ConstrainedBox(
                              constraints: const BoxConstraints(maxWidth: 280),
                              child: Text(
                                value.name,
                                maxLines: 2,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
            ),
            body: Builder(
              builder: (context) {
                if (value != null) {
                  return PRShowListView(model: value);
                }
                return PRInitView(
                    onTap: (model) => selectedModel.value = model);
              },
            ),
          );
        });
  }
}
