import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class RatingSelectorWidget extends StatelessWidget {
  final int currentRating;
  final IconData icon;
  ValueChanged<int> onRatingChanged;

  RatingSelectorWidget({this.currentRating, this.icon, this.onRatingChanged});

  @override
  Widget build(BuildContext context) {
    var icons = new List<IconButton>();
    icons.add(IconButton(
        icon: Icon(
          Icons.do_not_disturb_alt,
          color: currentRating >= 0 ? Colors.blue : Colors.grey,
        ),
        onPressed: () {
          onRatingChanged(0);
        }));
    for (var i = 1; i <= 5; i++) {
      icons.add(IconButton(
          icon: Icon(
            icon,
            color: currentRating >= i ? Colors.blue : Colors.grey,
          ),
          onPressed: () {
            onRatingChanged(i);
          }));
    }

    return Row(mainAxisAlignment: MainAxisAlignment.center, children: icons);
  }
}
