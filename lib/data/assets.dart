const String _pathImages = 'assets/images/';
const String _pathIcons = 'assets/icons/';

class DAssetImages {
  static const String welcome = '${_pathImages}welcome.png';
  static const String premium = '${_pathImages}premium.png';
  static const String paidAnalyst = '${_pathImages}paid_analyst.png';
  static const String bestAnalystEmpty = '${_pathImages}best_analyst_empty.png';
  static const String purposefulReading = '${_pathImages}purposeful_reading.png';

  static String limitTracker(bool isMax) =>
      '${_pathImages}limit_tracker${isMax ? '_max' : ''}.png';
}

class DAssetIcons {
  static const String analyst = '${_pathIcons}analyst.svg';
  static const String eventCalendar = '${_pathIcons}event_calendar.svg';
  static const String limitTracker = '${_pathIcons}limit_tracker.svg';
  static const String purposeful = '${_pathIcons}purposeful.svg';
  static const String settings = '${_pathIcons}settings.svg';
  static const String privacy = '${_pathIcons}privacy.svg';
  static const String terms = '${_pathIcons}terms.svg';
  static const String subscribe = '${_pathIcons}subscribe.svg';
  static const String bottomArrow = '${_pathIcons}bottom_arrow.svg';
}
