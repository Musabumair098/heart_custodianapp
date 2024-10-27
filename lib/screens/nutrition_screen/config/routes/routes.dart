import 'package:flutter/widgets.dart';


import '../../view/add-food/add-food.dart';
import '../../view/daily-summary-detail/daily-summary-detail.dart';
import '../../view/home/home_screen.dart';
import '../../view/nav/nav.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  HomeScreen.routeName: (context) => HomeScreen(),
  Nav.routeName : (context) => Nav(),
  DailySummaryDetailScreen.routeName: (context) => DailySummaryDetailScreen(),
  AddFoodScreen.routeName : (context) => AddFoodScreen()
};