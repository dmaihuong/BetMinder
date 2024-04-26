import 'package:bet_minder/models/bet_model.dart';
import 'package:bet_minder/services/bloc/bloc.dart';
import 'package:bet_minder/ui/screens/event_calendar/bloc/event.dart';
import 'package:bet_minder/ui/screens/event_calendar/bloc/state.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

import '../../../../models/calendar_model.dart';

class ECBloc extends DBloc<ECState, ECEvent, ECSuccess> {
  @override
  void mapEventToState(ECEvent event) {
    if (event is ECSelectedSportType) {
      newState(ECSuccess(type: event.type));
      _getData(event.type);
    } else if (event is ECCLoseView) {
      newState(ECInitState());
    }
  }

  Future<void> _getData(SportBetType type) async {
    Response response =
        await get(Uri.parse("https://www.thesportsdb.com/browse_calendar/"
            "?d=${DateFormat('yyyy-MM-dd').format(DateTime.now())}"
            "&s=${type.nameResponse}"));
    var document = parse(response.body);

    var elements = document.body?.getElementsByTagName('tbody').first.children;

    List<EventCalendarModel> models = [];

    if (elements != null && elements.isNotEmpty) {
      for (var element in elements) {
        if (element.children.length > 1) {
          String time = element.children[0].text;
          String leagueName = element.children[2].text;
          String commandNames = element.children[4].text;
          print(commandNames);
          String firstCommand = commandNames.split(' vs ').first;
          String secondCommand = commandNames.split(' vs ').last;

          models.add(
            EventCalendarModel(
                firstCommandName: firstCommand,
                leagueName: leagueName,
                secondCommandName: secondCommand,
                time: time),
          );
        }
      }
    }
    print(models.length);

    newSuccessState(successState.copyWith(models: models, loading: false));
  }
}
