class YelpOpenHours {
  YelpOpenHours.fromMap(Map<String, dynamic> data)
      : isOvernight = data["is_overnight"] as bool,
        end = data["end"] as String,
        start = data["start"] as String,
        day = data["day"] as int;

  final bool? isOvernight;
  final String? end;
  final String? start;
  final int? day;
}
