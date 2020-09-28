import 'package:flutter/material.dart';
import 'package:flutter_is_not_boring/routes.dart';
import 'package:flutter_is_not_boring/screens/activity/ActivityScreen.dart';
import 'package:flutter_is_not_boring/screens/find_activity/FindActivityScreen.dart';
import 'package:flutter_is_not_boring/screens/home/HomeScreen.dart';

void main() {
  runApp(FlutterIsNotBoringApp());
}

class FlutterIsNotBoringApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter is not boring",
      initialRoute: HomeScreen.id,
      onGenerateRoute: (setting) {
        if(setting.name == HomeScreen.id){
          return MaterialPageRoute(builder: (_) => HomeScreen());
        }else if(setting.name == ActivityScreen.id){
          var args = setting.arguments;
          return MaterialPageRoute(builder: (_) => ActivityScreen(args));
        }else if(setting.name == FindActivityScreen.id){
            return MaterialPageRoute(builder: (_) => FindActivityScreen());
          }
      },
    );
  }
}
