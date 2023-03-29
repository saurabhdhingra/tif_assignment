import 'package:flutter/material.dart';
import 'package:tif_assignment/enums/view_state.dart';

import '../api/data_service.dart';
import '../models/event.dart';

class HomeViewModel with ChangeNotifier {
  ViewState _state = ViewState.Idle;

  DataService service = DataService();

  late Event _selectedEvent;

  Event get selected => _selectedEvent;
  ViewState get viewState => _state;

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }

  Future<List> fetchEventList() async {
    setState(ViewState.Busy);

    var eventList = await service.fetchDataList();

    setState(ViewState.Idle);
    return eventList;
  }

  void setSelecetedEvent(Event event) {
    _selectedEvent = event;
    notifyListeners();
  }
}
