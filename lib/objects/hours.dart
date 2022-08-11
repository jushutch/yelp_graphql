import 'package:yelp_graphql/objects/open.dart';

class YelpHours {
  YelpHours.fromMap(Map<String, dynamic> data)
      : hoursType = data["hours_type"] as String,
        openHours = <Map<String, dynamic>>[...?data["open"]]
            .map((Map<String, dynamic> e) => YelpOpenHours.fromMap(e))
            .toList(),
        isOpenNow = data["is_open_now"] as bool;

  final String? hoursType;
  final List<YelpOpenHours>? openHours;
  final bool? isOpenNow;
}
