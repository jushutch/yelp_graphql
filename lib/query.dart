import 'package:yelp_graphql/child_field.dart';
import 'package:yelp_graphql/parent_field.dart';

class Query extends ParentField {
  Query(String query, List<String> arguments, List<ChildField> fields)
      : super(
            '$query(${arguments.where((element) => element != '').join(', ')})',
            fields);
}

class Search extends Query {
  Search(
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
            searchFields) {
    if (location == null && (longitude == null || latitude == null)) {
      throw Exception(
          'Either the location or longitude and latitude must not be null.');
    }
  }
}
