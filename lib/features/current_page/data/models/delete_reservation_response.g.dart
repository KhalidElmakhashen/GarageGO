// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_reservation_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteReservationResponse _$DeleteReservationResponseFromJson(
        Map<String, dynamic> json) =>
    DeleteReservationResponse(
      message: json['message'] as String?,
      status: json['status'] as bool?,
      data: json['data'] == null
          ? null
          : ResponseData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DeleteReservationResponseToJson(
        DeleteReservationResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'data': instance.data,
    };

ResponseData _$ResponseDataFromJson(Map<String, dynamic> json) => ResponseData(
      userId: (json['userId'] as num?)?.toInt(),
      garageId: (json['garageId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ResponseDataToJson(ResponseData instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'garageId': instance.garageId,
    };
