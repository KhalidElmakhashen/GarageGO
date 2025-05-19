


import 'package:json_annotation/json_annotation.dart';
part 'verification_email_response.g.dart';

@JsonSerializable()
class VerificationEmailResponse {
  final String message;


  VerificationEmailResponse({required this.message});

 factory VerificationEmailResponse.fromJson(Map<String, dynamic> json) =>
      _$VerificationEmailResponseFromJson(json);
}