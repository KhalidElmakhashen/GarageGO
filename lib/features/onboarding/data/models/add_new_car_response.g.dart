// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_new_car_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddNewCarResponse _$AddNewCarResponseFromJson(Map<String, dynamic> json) =>
    AddNewCarResponse(
      plateNumber: json['plateNumber'] as String?,
      model: json['model'] as String?,
      type: json['type'] as String?,
      userId: json['userId'] as String?,
    );

Map<String, dynamic> _$AddNewCarResponseToJson(AddNewCarResponse instance) =>
    <String, dynamic>{
      'plateNumber': instance.plateNumber,
      'model': instance.model,
      'type': instance.type,
      'userId': instance.userId,
    };
