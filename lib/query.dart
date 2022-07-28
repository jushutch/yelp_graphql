import 'package:yelp_graphql/child_field.dart';
import 'package:yelp_graphql/match_threshold.dart';
import 'package:yelp_graphql/parent_field.dart';

class Query extends ParentField {
  Query(String query, List<String> arguments, List<ChildField> fields)
      : super(
          '$query(${arguments.where((element) => element != '').join(', ')})',
          fields,
        );
}

class SearchQuery extends Query {
  SearchQuery(
    List<SearchField> searchFields, {
    String? term,
    int? limit,
    String? location,
    String? categories,
    bool? openNow,
    double? latitude,
    double? longitude,
    int? radius,
    int? offset,
    String? sortBy,
    String? price,
    int? openAt,
    String? locale,
    List<String>? attributes,
  }) : super(
          "search",
          <String>[
            if (limit != null) 'limit: $limit' else '',
            if (location != null) 'location: "$location"' else '',
            if (categories != null) 'categories: "$categories"' else '',
            if (openNow != null) 'open_now: $openNow' else '',
            if (latitude != null) 'latitude: $latitude' else '',
            if (longitude != null) 'longitude: $longitude' else '',
            if (radius != null) 'radius: $radius' else '',
            if (offset != null) 'offset: $offset' else '',
            if (sortBy != null) 'sort_by: $sortBy' else '',
            if (price != null) 'price: $price' else '',
            if (locale != null) 'locale: $locale' else '',
            if (attributes != null) 'attributes: $attributes' else '',
            if (openAt != null) 'open_at: $openAt' else '',
          ],
          searchFields,
        ) {
    if (location == null && (longitude == null || latitude == null)) {
      throw Exception(
          'Either the location or longitude and latitude must not be null.');
    }
  }
}

class BusinessQuery extends Query {
  BusinessQuery(
    List<BusinessField> businessFields, {
    required String id,
  }) : super(
          "business",
          <String>['id: "$id"'],
          businessFields,
        );
}

class BusinessMatchQuery extends Query {
  BusinessMatchQuery(
    List<BusinessMatchField> businessMatchFields, {
    required String name,
    required String address1,
    String? address2,
    String? address3,
    required String city,
    required String state,
    required String country,
    double? latitude,
    double? longitude,
    String? phone,
    String? postalCode,
    int? limit,
    MatchThreshold matchThreshold = MatchThreshold.DEFAULT,
  }) : super(
          "business_match",
          <String>[
            'name: "$name"',
            'address1: "$address1"',
            if (address2 != null) 'address2: "$address2"' else '',
            if (address3 != null) 'address2: "$address3"' else '',
            'city: "$city"',
            'state: "$state"',
            'country: "$country"',
            if (latitude != null) 'latitude: $latitude' else '',
            if (longitude != null) 'longitude: $longitude' else '',
            if (phone != null) 'phone: "$phone"' else '',
            if (postalCode != null) 'postal_code: "$postalCode"' else '',
            if (limit != null) 'limit: $limit' else '',
            'match_threshold: ${matchThresholds[matchThreshold]}',
          ],
          businessMatchFields,
        );
}
