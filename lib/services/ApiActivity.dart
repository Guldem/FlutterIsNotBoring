import 'package:json_annotation/json_annotation.dart';

/// This allows the `User` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'ApiActivity.g.dart';

@JsonSerializable()
class ApiActivity {
  final String activity;
  final double accessibility;
  final ActivityType type;
  final int participants;
  final double price;
  final String link;
  final String key;

  ApiActivity(
      {this.activity,
      this.accessibility,
      this.type,
      this.participants,
      this.price,
      this.link,
      this.key});

  factory ApiActivity.fromJson(Map<String, dynamic> json) =>
      _$ApiActivityFromJson(json);

  Map<String, dynamic> toJson() => _$ApiActivityToJson(this);
}

enum ActivityType {
  education,
  recreational,
  social,
  diy,
  charity,
  cooking,
  relaxation,
  music,
  busywork
}
