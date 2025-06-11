// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_cars_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCarsResponse _$GetCarsResponseFromJson(Map<String, dynamic> json) =>
    GetCarsResponse(
      status: json['status'] as String,
      message: json['message'] as String,
      cars: Car.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetCarsResponseToJson(GetCarsResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.cars,
    };

Car _$CarFromJson(Map<String, dynamic> json) => Car(
      carId: (json['carId'] as num).toInt(),
      plateNumber: json['plateNumber'] as String,
      model: json['model'] as String,
      type: json['type'] as String,
      userId: json['userId'] as String,
      spotId: json['spotId'] as String,
    );

Map<String, dynamic> _$CarToJson(Car instance) => <String, dynamic>{
      'carId': instance.carId,
      'plateNumber': instance.plateNumber,
      'model': instance.model,
      'type': instance.type,
      'userId': instance.userId,
      'spotId': instance.spotId,
    };
