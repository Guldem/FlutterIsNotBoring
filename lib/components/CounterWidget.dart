import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CounterWidget extends StatelessWidget {
  int minValue = 0;
  final int maxValue;
  final int currentValue;
  int incrementation = 1;
  final ValueChanged<int> onChange;

  CounterWidget({
    this.minValue,
    this.maxValue,
    this.currentValue,
    this.incrementation,
    this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.remove),
          onPressed: (currentValue - incrementation) < minValue
              ? null
              : () {
                  onChange(currentValue - incrementation);
                },
        ),
        Text(currentValue.toString()),
        IconButton(
          icon: Icon(Icons.add),
          onPressed: (currentValue + incrementation) > maxValue
              ? null
              : () {
                  onChange(currentValue + incrementation);
                },
        ),
      ],
    );
  }
}
