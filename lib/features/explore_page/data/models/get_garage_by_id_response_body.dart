  
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_garage_by_id_response_body.g.dart';

@JsonSerializable()
class GetGarageByIdResponse {
  String? message;
  @JsonKey(name: 'data')
  GarageData? garageData;
  bool? status;

  GetGarageByIdResponse({this.message, this.garageData, this.status});

  factory GetGarageByIdResponse.fromJson(Map<String, dynamic> json) =>
      _$GetGarageByIdResponseFromJson(json);
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