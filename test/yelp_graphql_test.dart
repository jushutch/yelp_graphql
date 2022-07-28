import 'package:flutter_test/flutter_test.dart';
import 'package:yelp_graphql/yelp_graphql.dart';

void main() {
  group('Input validation', () {
    test('No location, latitude, or longitude given', () {
      expect(
          () => SearchQuery([
                Business([Name()])
              ]),
          throwsException);
    });

    test('Only one of longitude or latidude given', () {
      expect(
          () => SearchQuery([
                Business([Name()])
              ], longitude: 12.1),
          throwsException);
      expect(
          () => SearchQuery([
                Business([Name()])
              ], latitude: 12.1),
          throwsException);
    });
  });

  group('Yelp GrahQL API', () {
    test(
      'Works for duplicate fields',
      () async {
        String key =
            '9qVGSvS3AfCnQfDVP0h9RdFcawAD4q7pK6CtEqv6nlr1BlKgdjCbPVFG5AuJmQilsl9Gl_tsTbIpGUjI1IOy8-7Q_6I1YF-OwYEb9B3xR6mo7Cwa-M9nx_-n2mnDYXYx';
        Query query = SearchQuery(
          [
            Total(),
            Business([Name()]),
            Total(),
            Business([Rating()]),
          ],
          location: 'Minneapolis',
        );
        Map<String, dynamic> data = await YelpGraphQL(key).query(query);
      },
      tags: 'prod',
      skip: 'Only ran before deploying to production',
    );
  });
}
