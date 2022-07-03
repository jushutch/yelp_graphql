import 'package:yelp_graphql/child_field.dart';

class Field {
  Field(this.field);

  final String field;

  @override
  String toString() {
    return field;
  }
}

class Total extends Field with SearchField {
  Total() : super("total");
}

class Name extends Field with BusinessField {
  Name() : super("name");
}

class Rating extends Field with BusinessField {
  Rating() : super("rating");
}

class Price extends Field with BusinessField {
  Price() : super("price");
}

class Distance extends Field with BusinessField {
  Distance() : super("distance");
}

class Photos extends Field with BusinessField {
  Photos() : super("photos");
}

class Address1 extends Field with LocationField {
  Address1() : super("address1");
}

class City extends Field with LocationField {
  City() : super("city");
}

class State extends Field with LocationField {
  State() : super("state");
}

class Country extends Field with LocationField {
  Country() : super("country");
}

class PostalCode extends Field with LocationField {
  PostalCode() : super("postal_code");
}

class Start extends Field with OpenField {
  Start() : super("start");
}

class End extends Field with OpenField {
  End() : super("end");
}

class Day extends Field with OpenField {
  Day() : super("day");
}
