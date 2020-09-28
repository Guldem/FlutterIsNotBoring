import 'package:flutter/material.dart';
import 'package:flutter_is_not_boring/screens/activity/ActivityScreen.dart';
import 'package:flutter_is_not_boring/screens/find_activity/FindActivityScreen.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatelessWidget {
  static const String id = "home_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Flutter is not boring"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Lottie.asset("assets/lottie/boring.json",
                  width: 250,
                  height: 250,
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.center),
            ),
            Text(
              "I think flutter is not boring. But are you still bored?",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            Container(
                margin: EdgeInsets.all(10),
                child: Column(children: [
                  Text("Click `Surprise me` for an random activity!"),
                  RaisedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, ActivityScreen.id);
                    },
                    child: Text("Surprise me?", textAlign: TextAlign.center),
                  )
                ])),
            Container(
                margin: EdgeInsets.all(10),
                child: Column(children: [
                  Text(
                    "Not in for a total random surprise? Click `Help me` to find a suitable activity",
                    textAlign: TextAlign.center,
                  ),
                  RaisedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, FindActivityScreen.id);
                    },
                    child: Text("Help me", textAlign: TextAlign.center),
                  )
                ])),
          ],
        ));
  }
}
