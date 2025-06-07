// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_new_car_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddNewCarRequest _$AddNewCarRequestFromJson(Map<String, dynamic> json) =>
    AddNewCarRequest(
      plateNumber: json['plateNumber'] as String?,
      model: json['model'] as String?,
      type: json['type'] as String?,
      userId: json['userId'] as String?,
    );

Map<String, dynamic> _$AddNewCarRequestToJson(AddNewCarRequest instance) =>
    <String, dynamic>{
      'plateNumber': instance.plateNumber,
      'model': instance.model,
      'type': instance.type,
      'userId': instance.userId,
    };
