import 'package:flutter/material.dart';
import 'package:flutter_is_not_boring/extensions/String.dart';
import 'package:flutter_is_not_boring/extensions/double.dart';
import 'package:flutter_is_not_boring/services/ApiActivity.dart';
import 'package:flutter_is_not_boring/services/api/ApiService.dart';
import 'package:flutter_is_not_boring/util/ActivityTypeHelper.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

class ActivityArguments {
  final int accessibility;
  final ActivityType type;
  final int participants;
  final int price;
  final String key;

  ActivityArguments(
      this.accessibility, this.type, this.participants, this.price, this.key);
}

class ActivityScreen extends StatefulWidget {
  final ActivityArguments args;
  static const String id = "activity_screen";

  ActivityScreen(this.args);

  @override
  _ActivityState createState() => _ActivityState();
}

class _ActivityState extends State<ActivityScreen> {
  Future<ApiActivity> futureActivity;

  @override
  void initState() {
    super.initState();

    // final ActivityArguments args = ModalRoute.of(context).settings.arguments;

    if (widget.args != null) {
      futureActivity = ApiService().fetchFilteredActivity(widget.args);
    } else {
      futureActivity = ApiService().fetchRandomActivity();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Activity"),
        ),
        body: FutureBuilder<ApiActivity>(
          future: futureActivity,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ActivityDescription(
                activity: snapshot.data,
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            // By default, show a loading spinner.
            return CircularProgressIndicator();
          },
        ));
  }
}

class ActivityDescription extends StatelessWidget {
  final ApiActivity activity;

  ActivityDescription({this.activity});

  @override
  Widget build(BuildContext context) =>
      Column(crossAxisAlignment: CrossAxisAlignment.center, children: <Widget>[
        Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
            child: Row(children: <Widget>[
              Expanded(
                child: Lottie.asset(
                    ActivityTypeHelper.getLottieAsset(activity.type),
                    width: 150,
                    height: 150,
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.center),
              ),
            ])),
        ChoiceChip(
          label: Text(
            ActivityTypeHelper.getName(activity.type),
          ),
          selected: true,
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 5, 0, 20),
          child: Text(
            activity.activity,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Participants(participants: activity.participants),
        IconScore(
            score: activity.accessibility.toFiveStarRating(),
            icon: Icons.star,
            title: "Difficulty"),
        IconScore(
            score: activity.price.toFiveStarRating(),
            icon: Icons.euro_symbol,
            title: "Price"),
        activity.link.isNotEmptyOrNull()
            ? RaisedButton(
                child: Text("More information"),
                onPressed: () {
                  _launchURL(activity.link);
                },
              )
            : Container()
      ]);

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class Participants extends StatelessWidget {
  final int participants;

  Participants({this.participants});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("Participants: " + participants.toString()),
        getParticipantsIcons(participants)
      ],
    );
  }

  Widget getParticipantsIcons(int participants) {
    List<Icon> iconList = new List<Icon>();
    switch (participants) {
      case 1:
        iconList.add(Icon(Icons.person));
        break;
      case 2:
        iconList.add(Icon(Icons.people));
        break;
      case 3:
        iconList.add(Icon(Icons.people));
        iconList.add(Icon(Icons.person));
        break;
      default:
        iconList.add(Icon(Icons.directions_bus));
        break;
    }
    return Row(
      children: iconList,
    );
  }
}

class IconScore extends StatelessWidget {
  final int score;
  final IconData icon;
  final String title;

  IconScore({this.score, this.icon, this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(title),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            score == 0
                ? Icon(
                    Icons.remove,
                    color: Colors.blueGrey,
                  )
                : Container(),
            for (var i = 1; i < score; i++)
              Icon(
                icon,
                color: Colors.blueGrey,
              )
          ],
        )
      ],
    );
  }
}
