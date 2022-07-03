import 'package:flutter_test/flutter_test.dart';
import 'package:yelp_graphql/parent_field.dart';
import 'package:yelp_graphql/yelp_graphql.dart';

void main() {
  group("Input validation", () {
    test('No location, latitude, or longitude given', () {
      expect(
          () => Search([
                Business([Name()])
              ]),
          throwsException);
    });

    test('Only one of longitude or latidude given', () {
      expect(
          () => Search([
                Business([Name()])
              ], longitude: 12.1),
          throwsException);
      expect(
          () => Search([
                Business([Name()])
              ], latitude: 12.1),
          throwsException);
    });
  });

  group("Yelp GrahQL API", () {
    test("Works for duplicate fields", () async {
      String key =
          "9qVGSvS3AfCnQfDVP0h9RdFcawAD4q7pK6CtEqv6nlr1BlKgdjCbPVFG5AuJmQilsl9Gl_tsTbIpGUjI1IOy8-7Q_6I1YF-OwYEb9B3xR6mo7Cwa-M9nx_-n2mnDYXYx";
      Query query = Search(
        [
          Total(),
          Business([Name()]),
          Total(),
          Business([Rating()]),
        ],
        location: "Minneapolis",
      );
      print(query);
      Map<String, dynamic> data = await YelpGraphQL(key).query(query);
      print(data);
    });
  });
}
