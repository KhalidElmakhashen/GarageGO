

import 'package:json_annotation/json_annotation.dart';

part 'get_cars_response.g.dart';

@JsonSerializable()
class GetCarsResponse {
  final String status;
  final String message;
  @JsonKey(name: 'data')
  final  Car cars;
  GetCarsResponse({
    required this.status,
    required this.message,
    required this.cars,
  });


  factory GetCarsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetCarsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetCarsResponseToJson(this);
  
}


@JsonSerializable()
class Car {
  final int carId;
  final String plateNumber;
  final String model;
  final String type;
  final String userId;
  final String spotId;

  Car({
    required this.carId,
    required this.plateNumber,
    required this.model,
    required this.type,
    required this.userId,
    required this.spotId,
  });


  factory Car.fromJson(Map<String, dynamic> json) => _$CarFromJson(json);

  Map<String, dynamic> toJson() => _$CarToJson(this);
}