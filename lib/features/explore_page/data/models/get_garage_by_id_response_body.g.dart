// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_garage_by_id_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetGarageByIdResponse _$GetGarageByIdResponseFromJson(
        Map<String, dynamic> json) =>
    GetGarageByIdResponse(
      message: json['message'] as String?,
      garageData: json['data'] == null
          ? null
          : GarageData.fromJson(json['data'] as Map<String, dynamic>),
      status: json['status'] as bool?,
    );

Map<String, dynamic> _$GetGarageByIdResponseToJson(
        GetGarageByIdResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.garageData,
      'status': instance.status,
    };

GarageData _$GarageDataFromJson(Map<String, dynamic> json) => GarageData(
      garageId: (json['garageId'] as num).toInt(),
      name: json['name'] as String,
      address: json['address'] as String,
      city: json['city'] as String,
      totalSpots: (json['totalSpots'] as num).toInt(),
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      availableSpots: (json['availableSpots'] as num).toInt(),
      reservedSpots: (json['reservedSpots'] as num).toInt(),
    );

Map<String, dynamic> _$GarageDataToJson(GarageData instance) =>
    <String, dynamic>{
      'garageId': instance.garageId,
      'name': instance.name,
      'address': instance.address,
      'city': instance.city,
      'totalSpots': instance.totalSpots,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'availableSpots': instance.availableSpots,
      'reservedSpots': instance.reservedSpots,
    };
