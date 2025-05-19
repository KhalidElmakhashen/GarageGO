// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reserve_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReserveResponse _$ReserveResponseFromJson(Map<String, dynamic> json) =>
    ReserveResponse(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : ResponseData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ReserveResponseToJson(ReserveResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

ResponseData _$ResponseDataFromJson(Map<String, dynamic> json) => ResponseData(
      reservationRecordId: (json['reservationRecordId'] as num).toInt(),
      startDate: json['startDate'] as String,
      endDate: json['endDate'] as String,
    );

Map<String, dynamic> _$ResponseDataToJson(ResponseData instance) =>
    <String, dynamic>{
      'reservationRecordId': instance.reservationRecordId,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
    };
