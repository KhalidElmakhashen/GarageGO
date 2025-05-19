// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_garages_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllGaragesResponse _$GetAllGaragesResponseFromJson(
        Map<String, dynamic> json) =>
    GetAllGaragesResponse(
      message: json['message'] as String?,
      garageData: (json['data'] as List<dynamic>?)
          ?.map((e) => GarageData.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as bool?,
    );

Map<String, dynamic> _$GetAllGaragesResponseToJson(
        GetAllGaragesResponse instance) =>
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
