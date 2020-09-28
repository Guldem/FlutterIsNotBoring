import 'package:flutter_is_not_boring/services/ApiActivity.dart';

class ActivityTypeHelper {
  static String getLottieAsset(ActivityType type) {
    switch (type) {
      case ActivityType.education:
        return "assets/lottie/education.json";
      case ActivityType.recreational:
        return "assets/lottie/recreational.json";
        break;
      case ActivityType.social:
        return "assets/lottie/social.json";
        break;
      case ActivityType.diy:
        return "assets/lottie/diy.json";
        break;
      case ActivityType.charity:
        return "assets/lottie/charity.json";
        break;
      case ActivityType.cooking:
        return "assets/lottie/cooking.json";
        break;
      case ActivityType.relaxation:
        return "assets/lottie/relaxation.json";
        break;
      case ActivityType.music:
        return "assets/lottie/music.json";
        break;
      case ActivityType.busywork:
        return "assets/lottie/busywork.json";
        break;
    }
  }

  static String getName(ActivityType type) {
    switch (type) {
      case ActivityType.education:
        return "Education";
      case ActivityType.recreational:
        return "Recreational";
        break;
      case ActivityType.social:
        return "Social";
        break;
      case ActivityType.diy:
        return "Diy";
        break;
      case ActivityType.charity:
        return "Charity";
        break;
      case ActivityType.cooking:
        return "Cooking";
        break;
      case ActivityType.relaxation:
        return "Relaxation";
        break;
      case ActivityType.music:
        return "Music";
        break;
      case ActivityType.busywork:
        return "Busywork";
        break;
    }
  }
}
