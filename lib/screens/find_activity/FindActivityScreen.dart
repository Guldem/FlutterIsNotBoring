import 'package:flutter/material.dart';
import 'package:flutter_is_not_boring/components/CounterWidget.dart';
import 'package:flutter_is_not_boring/components/RatingSelectorWidget.dart';
import 'package:flutter_is_not_boring/screens/activity/ActivityScreen.dart';
import 'package:flutter_is_not_boring/services/ApiActivity.dart';
import 'package:flutter_is_not_boring/util/ActivityTypeHelper.dart';

class FindActivityScreen extends StatefulWidget {
  static const String id = "find_activity_screen";

  @override
  FindActivityFormState createState() => FindActivityFormState();
}

class FindActivityFormState extends State<FindActivityScreen> {
  final _formKey = GlobalKey<FormState>();
  ActivityType _selectedType;
  int _maxPrice = 0;
  int _maxAccessibility = 0;
  int _participants = 1;

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(
        appBar: AppBar(
          title: Text("Help me find an Activity"),
        ),
        body: Form(
            key: _formKey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Please fill in a few Preferences to help you get un-bored.",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      )),
                  Container(
                      margin: EdgeInsets.all(10),
                      child: Column(children: [
                        Text("For what kind of activity are you looking?"),
                        _buildChips()
                      ])),
                  Container(
                      margin: EdgeInsets.all(10),
                      child: Column(children: [
                        Text("How difficult do want the activity?"),
                        Text("(1 least difficult - 5 most difficult)"),
                        RatingSelectorWidget(
                          currentRating: _maxAccessibility,
                          icon: Icons.star,
                          onRatingChanged: (value) {
                            setState(() {
                              _maxAccessibility = value;
                            });
                          },
                        )
                      ])),
                  Container(
                      margin: EdgeInsets.all(10),
                      child: Column(children: [
                        Text("How must may the activity cost?"),
                        Text("(1 cheap - 5 expansive)"),
                        RatingSelectorWidget(
                          currentRating: _maxPrice,
                          icon: Icons.euro_symbol,
                          onRatingChanged: (value) {
                            setState(() {
                              _maxPrice = value;
                            });
                          },
                        )
                      ])),
                  Container(
                      margin: EdgeInsets.all(10),
                      child: Column(children: [
                        Row(mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                          Text("For how many persons is the activity?"),
                          Icon(Icons.people)
                        ]),
                        CounterWidget(
                            minValue: 1,
                            maxValue: 10,
                            currentValue: _participants,
                            incrementation: 1,
                            onChange: (value) {
                              setState(() {
                                _participants = value;
                              });
                            })
                      ])),
                  RaisedButton(
                    child: Text("Find me an acitvity!"),
                    onPressed: () {
                      // When the user taps the button, navigate to a named route
                      // and provide the arguments as an optional parameter.
                      Navigator.pushNamed(
                        context,
                        ActivityScreen.id,
                        arguments: ActivityArguments(_maxAccessibility,
                            _selectedType, _participants, _maxPrice, null),
                      );
                    },
                  ),
                ])));
  }

  Widget _buildChips() {
    var chips = new List<ChoiceChip>();
    for (var type in ActivityType.values) {
      chips.add(ChoiceChip(
        selected: _selectedType == type,
        label: Text(ActivityTypeHelper.getName(type)),
        // selectedColor: Colors.blueGrey,
        onSelected: (bool selected) {
          setState(() {
            if (selected) {
              _selectedType = type;
            } else {
              _selectedType = null;
            }
          });
        },
      ));
    }
    return Column(
      children: <Widget>[
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: chips.sublist(0, 3)),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: chips.sublist(3, 6)),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: chips.sublist(6, 9)),
      ],
    );
  }
}
