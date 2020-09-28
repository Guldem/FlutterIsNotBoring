import 'dart:convert';

import 'package:flutter_is_not_boring/screens/activity/ActivityScreen.dart';
import 'package:flutter_is_not_boring/services/ApiActivity.dart';
import 'package:flutter_is_not_boring/util/ActivityTypeHelper.dart';
import 'package:flutter_is_not_boring/extensions/int.dart';
import 'package:http/http.dart' as http;

final String base_url = "www.boredapi.com";

class ApiService {
  Future<ApiActivity> fetchRandomActivity() async {
    final json = await _returnResponse(Uri.https(base_url,'/api/activity/'));
    return ApiActivity.fromJson(json);
  }

  Future<ApiActivity> fetchFilteredActivity(ActivityArguments activityArguments) async{
    var parameters = createQueryParameters(activityArguments.type, activityArguments.accessibility, activityArguments.price, activityArguments.participants);
    final json = await _returnResponse(Uri.https(base_url,'/api/activity/', parameters));
    return ApiActivity.fromJson(json);
  }

  Map<String, String> createQueryParameters(ActivityType type,
      int accessibility, int price, int participants) {
    var queryParameters = new Map<String, String>();
    if (type != null) {
      queryParameters["type"] = ActivityTypeHelper.getName(type).toLowerCase();
    }
    if (accessibility > 0) {
      queryParameters["minaccessibility"] = "0";
      queryParameters["maxaccessibility"] =
          accessibility.fromFiveStarRating().toString();
    }
    if (price > 0) {
      queryParameters["minprice"] = "0";
      queryParameters["maxprice"] = price.fromFiveStarRating().toString();
    }
    if (participants != null) {
      queryParameters["participants"] = participants.toString();
    }
    return queryParameters;
  }

  dynamic _returnResponse(Uri uri) async {
    print(uri.toString());
    var response = await http.get(uri);

    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body);
        print(responseJson);
        return responseJson;
      default:
        throw Exception('Failed to load data ${response.statusCode}');
    }
  }
}
