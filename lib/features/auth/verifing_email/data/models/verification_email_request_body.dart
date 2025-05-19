

import 'package:json_annotation/json_annotation.dart';

part 'verification_email_request_body.g.dart';

@JsonSerializable()
class VerificationEmailRequestBody {
  final int id;
  final String code;


  VerificationEmailRequestBody({required this.id, required this.code});

 Map<String, dynamic> toJson() =>   _$VerificationEmailRequestBodyToJson(this);
}