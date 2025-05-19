// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reserve_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReserveRequestBody _$ReserveRequestBodyFromJson(Map<String, dynamic> json) =>
    ReserveRequestBody(
      garageId: (json['garageId'] as num).toInt(),
      userId: (json['userId'] as num).toInt(),
    );

Map<String, dynamic> _$ReserveRequestBodyToJson(ReserveRequestBody instance) =>
    <String, dynamic>{
      'garageId': instance.garageId,
      'userId': instance.userId,
    };
