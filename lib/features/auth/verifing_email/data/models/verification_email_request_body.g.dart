// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verification_email_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerificationEmailRequestBody _$VerificationEmailRequestBodyFromJson(
        Map<String, dynamic> json) =>
    VerificationEmailRequestBody(
      id: (json['id'] as num).toInt(),
      code: json['code'] as String,
    );

Map<String, dynamic> _$VerificationEmailRequestBodyToJson(
        VerificationEmailRequestBody instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
    };
