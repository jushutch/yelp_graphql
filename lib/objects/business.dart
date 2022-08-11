import 'package:yelp_graphql/objects/hours.dart';
import 'package:yelp_graphql/objects/location.dart';

class YelpBusiness {
  YelpBusiness.fromMap(Map<String, dynamic> data)
      : name = data["name"] as String,
        id = data["id"] as String,
        alias = data["alias"] as String,
        isClaimed = data["is_claimed"] as bool,
        isClosed = data["is_closed"] as bool,
        url = data["url"] as String,
        phone = data["phone"] as String,
        displayPhone = data["display_phone"] as String,
        reviewCount = data["review_count"] as int,
        rating = data["rating"] as double,
        price = data["price"] as String,
        distance = data["distance"] as double,
        location = data.containsKey("location")
            ? YelpLocation.fromMap(data["location"] as Map<String, dynamic>)
            : null,
        photos = <String>[...?data["photos"]],
        hours = data.containsKey("location")
            ? YelpHours.fromMap(
                (data["hours"] as List<dynamic>)[0] as Map<String, dynamic>)
            : null;

  final String? name;
  final String? id;
  final String? alias;
  final bool? isClaimed;
  final bool? isClosed;
  final String? url;
  final String? phone;
  final String? displayPhone;
  final int? reviewCount;
  final double? rating;
  final String? price;
  final double? distance;
  final YelpLocation? location;
  final List<String>? photos;
  final YelpHours? hours;
}
