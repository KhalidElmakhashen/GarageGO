

import 'package:json_annotation/json_annotation.dart';

part 'get_all_garages_response_body.g.dart';

@JsonSerializable()
class GetAllGaragesResponse {
  String? message;
  @JsonKey(name: 'data')
  List<GarageData>? garageData;
  bool? status;

  GetAllGaragesResponse({this.message, this.garageData, this.status});

  factory GetAllGaragesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAllGaragesResponseFromJson(json);
}

@JsonSerializable()
class GarageData {
  int garageId;
  String name;
  String address;
  String city;
  int totalSpots;
  double latitude;
  double longitude;
  int availableSpots;
  int reservedSpots;


  GarageData({
    required this.garageId,
    required this.name,
    required this.address,
    required this.city,
    required this.totalSpots,
    required this.latitude,
    required this.longitude,
    required this.availableSpots,
    required this.reservedSpots,
  });

  factory GarageData.fromJson(Map<String, dynamic> json) =>
      _$GarageDataFromJson(json);
}
