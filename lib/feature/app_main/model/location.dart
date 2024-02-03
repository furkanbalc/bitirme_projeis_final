import 'package:photo_manager/photo_manager.dart';

class ProductLocation {
  double? lat;
  double? long;

  ProductLocation({
    this.lat,
    this.long,
  });

  LatLng get location => LatLng(latitude: lat ?? 0.0, longitude: long ?? 0.0);

  ProductLocation copyWith({
    double? lat,
    double? long,
  }) {
    return ProductLocation(
      lat: lat ?? this.lat,
      long: long ?? this.long,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'lat': lat.toString(),
      'long': long.toString(),
    };
  }

  factory ProductLocation.fromJson(Map<String, dynamic> json) {
    return ProductLocation(
      lat: json['lat'] as double?,
      long: json['long'] as double?,
    );
  }
}
