class Created {
    DateTime date;
    int timezoneType;
    String timezone;

    Created({
        required this.date,
        required this.timezoneType,
        required this.timezone,
    });

    factory Created.fromJson(Map<String, dynamic> json) => Created(
        date: DateTime.parse(json["date"]),
        timezoneType: json["timezone_type"],
        timezone: json["timezone"],
    );

    Map<String, dynamic> toJson() => {
        "date": date.toIso8601String(),
        "timezone_type": timezoneType,
        "timezone": timezone,
    };
}