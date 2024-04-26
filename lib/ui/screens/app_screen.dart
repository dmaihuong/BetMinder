import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../data/assets.dart';
import '../../data/styles.dart';
import '../../main.dart';
import '../widgets/buttons/click_area.dart';
import 'best_analyst/screen.dart';
import 'event_calendar/screen.dart';
import 'limit_tracker/screen.dart';
import 'purposeful_reading/screen.dart';
import 'settings/screen.dart';

enum TypeScreen { analyst, eventCalendar, limitTracker, purposeful, settings }

class AppScreen extends StatefulWidget {
  const AppScreen({Key? key}) : super(key: key);

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  late ValueNotifier<TypeScreen> screenType;

  @override
  void initState() {
    screenType = ValueNotifier(TypeScreen.limitTracker);
    super.initState();
  }

  @override
  void dispose() {
    screenType.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ModelController modelController = context.watch<ModelController>();

    return Scaffold(
      body: ValueListenableBuilder(
          valueListenable: screenType,
          builder: (context, value, _) {
            return Column(
              children: [
                Expanded(child: Builder(
                  builder: (context) {
                    if (value == TypeScreen.settings) {
                      return const SettingsScreen();
                    } else if (value == TypeScreen.limitTracker) {
                      return const LimitTrackerScreen();
                    } else if (value == TypeScreen.analyst) {
                      return const BestAnalystScreen();
                    } else if (value == TypeScreen.purposeful) {
                      return const PurposefulReadingScreen();
                    } else if (value == TypeScreen.eventCalendar) {
                      return EventCalendarScreen();
                    }
                    return const SizedBox();
                  },
                )),
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(color: kPromptTextColor),
                  padding: const EdgeInsets.symmetric(
                      vertical: kDefaultPadding,
                      horizontal: kDefaultPadding / 2),
                  child: SafeArea(
                    top: false,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _Element(
                            icon: DAssetIcons.limitTracker,
                            text: 'Limit\nTracker',
                            onTap: () {
                              screenType.value = TypeScreen.limitTracker;
                            },
                            isEnabled: value == TypeScreen.limitTracker),
                        _Element(
                            icon: DAssetIcons.analyst,
                            text: 'Bets\nAnalyst ',
                            onTap: () {
                              screenType.value = TypeScreen.analyst;
                            },
                            isEnabled: value == TypeScreen.analyst),
                        _Element(
                            text: 'Events\nсalendar',
                            icon: DAssetIcons.eventCalendar,
                            onTap: () =>
                                screenType.value = TypeScreen.eventCalendar,
                            isEnabled: value == TypeScreen.eventCalendar),
                        _Element(
                            text: 'Purposeful\nreading',
                            icon: DAssetIcons.purposeful,
                            onTap: () =>
                                screenType.value = TypeScreen.purposeful,
                            isEnabled: value == TypeScreen.purposeful),
                        _Element(
                            text: 'App\nSettings',
                            icon: DAssetIcons.settings,
                            onTap: () {
                              screenType.value = TypeScreen.settings;
                            },
                            isEnabled: value == TypeScreen.settings),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}

class _Element extends StatelessWidget {
  final String icon;
  final String text;
  final bool isEnabled;

  final VoidCallback onTap;

  const _Element(
      {Key? key,
      required this.icon,
      required this.text,
      required this.onTap,
      required this.isEnabled})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ClickArea(
        onTap: () {
          if (!isEnabled) {
            onTap();
          }
        },
        child: Column(
          children: [
            SvgPicture.asset(
              icon,
              colorFilter: ColorFilter.mode(
                  isEnabled ? kAccentColor : kWhiteText, BlendMode.srcIn),
            ),
            const SizedBox(height: kDefaultPadding / 4),
            AutoSizeText(
              text,
              textAlign: TextAlign.center,
              maxLines: 2,
              style: TextStyle(
                fontSize: 12,
                color: isEnabled ? kAccentColor : kWhiteText,
              ),
            )
          ],
        ),
      ),
    );
  }
}
