// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'package:json_annotation/json_annotation.dart';

part 'get_user_data_response.g.dart';

@JsonSerializable()
class GetUserDataResponse {
  bool? status;
  String? message;
  userData? data;


  GetUserDataResponse({
    this.status,
    this.message,
    this.data,
  });

  factory GetUserDataResponse.fromJson(Map<String, dynamic> json) =>
      _$GetUserDataResponseFromJson(json);


  
}


@JsonSerializable()
class userData {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phoneNumber;

  userData({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
  });

  factory userData.fromJson(Map<String, dynamic> json) =>
      _$userDataFromJson(json);


  
}