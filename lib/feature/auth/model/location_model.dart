class Location {
  double? lat;
  double? long;

  Location({
    this.lat,
    this.long,
  });

  Location copyWith({
    double? lat,
    double? long,
  }) {
    return Location(
      lat: lat ?? this.lat,
      long: long ?? this.long,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'lat': lat,
      'long': long,
    };
  }

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      lat: json['lat'] is double ? json['lat'] as double : double.tryParse(json['lat'] as String? ?? ''),
      long: json['lng'] is double ? json['lng'] as double : double.tryParse(json['lng'] as String? ?? ''),
    );
  }
}
