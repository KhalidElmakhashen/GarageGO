import 'package:json_annotation/json_annotation.dart';
part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  String? message;
  @JsonKey(name: 'data')
  UserData? userData;
  bool? status;

  LoginResponse({this.message, this.userData, this.status});

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}

@JsonSerializable()
class UserData {
  String? token;
  int? userId;
  int? reservationId;


  UserData({this.token, this.userId, this.reservationId});

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}
