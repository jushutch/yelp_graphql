import 'dart:convert';
import 'package:http/http.dart';
import 'package:yelp_graphql/query.dart';
export 'package:yelp_graphql/query.dart';
export 'package:yelp_graphql/field.dart';
export 'package:yelp_graphql/parent_field.dart';
export 'package:yelp_graphql/child_field.dart';
export 'package:yelp_graphql/attributes.dart';
export 'package:yelp_graphql/objects/business.dart';
export 'package:yelp_graphql/objects/hours.dart';
export 'package:yelp_graphql/objects/location.dart';
export 'package:yelp_graphql/objects/open.dart';

class YelpGraphQL {
  YelpGraphQL(this.apiKey);

  final String apiKey;

  Future<Map<String, dynamic>> query(Query query) async {
    Map<String, dynamic> queryJson = <String, String>{'query': "{$query}"};
    Response yelpResponse = await post(
      Uri(
        path: "v3/graphql",
        scheme: "https",
        host: "api.yelp.com",
      ),
      headers: <String, String>{
        "Authorization": "Bearer $apiKey",
        "Content-Type": "application/json",
        "Accept-Language": "en_US",
      },
      body: jsonEncode(queryJson),
    );
    if (yelpResponse.statusCode != 200) {
      throw Exception(
        "Unable to reach Yelp GraphQL. Status code ${yelpResponse.reasonPhrase}.",
      );
    }
    Map<String, dynamic> body =
        json.decode(yelpResponse.body) as Map<String, dynamic>;
    if (body.containsKey("errors")) {
      throw Exception(
          "There was an error in the query response: ${body["errors"]}");
    }
    if (!body.containsKey("data")) {
      throw Exception("Yelp GraphQL response did not include data.");
    }
    return body["data"] as Map<String, dynamic>;
  }
}
