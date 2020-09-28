

import 'package:flutter/material.dart';
import 'package:flutter_is_not_boring/screens/activity/ActivityScreen.dart';
import 'package:flutter_is_not_boring/screens/find_activity/FindActivityScreen.dart';
import 'package:flutter_is_not_boring/screens/home/HomeScreen.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  "/": (BuildContext context) => HomeScreen(),
  // "/Activity": (BuildContext context) => ActivityScreen(),
  "/FindActivity": (BuildContext context) => FindActivityScreen(),
};