import 'package:flutter/material.dart';
import 'package:tif_assignment/views/eventDetails_view.dart';
import 'package:tif_assignment/views/home_view.dart';
import 'package:tif_assignment/views/search_view.dart';
import 'package:tif_assignment/views/undefined.dart';

import 'models/event.dart';

const String homeViewRoute = '/';
const String detailsViewRoute = 'details';
const String searchViewRoute = 'search';
const String contactViewRoute = 'contact';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case homeViewRoute:
      return MaterialPageRoute(builder: (context) => const HomeView());
    case searchViewRoute:
      return MaterialPageRoute(builder: (context) => const SearchView());
    default:
      return MaterialPageRoute(
          builder: (context) => UndefinedView(name: settings.name ?? "null"));
  }
}
