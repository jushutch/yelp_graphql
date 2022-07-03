import 'package:yelp_graphql/child_field.dart';

import 'field.dart';

class ParentField extends Field {
  ParentField(String fieldName, List<ChildField> childFields)
      : super(
          "$fieldName {${childFields.join("\n")}}",
        ) {
    if (childFields.isEmpty) {
      throw Exception("The $fieldName field requires at least one child field");
    }
  }
}

class Business extends ParentField with SearchField {
  Business(List<BusinessField> fields)
      : super(
          "business",
          fields,
        );
}

class Hours extends ParentField with BusinessField {
  Hours(List<HourField> fields)
      : super(
          "hours",
          fields,
        );
}

class Location extends ParentField with BusinessField {
  Location(List<LocationField> fields)
      : super(
          "location",
          fields,
        );
}

class Open extends ParentField with HourField {
  Open(List<OpenField> fields)
      : super(
          "open",
          fields,
        );
}
