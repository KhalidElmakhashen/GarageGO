import 'package:json_annotation/json_annotation.dart';

part 'sign_up_response.g.dart';

@JsonSerializable()
class SignupResponse {
  @JsonKey(name: 'data')
  UserData? userData;

  SignupResponse({this.userData});

  factory SignupResponse.fromJson(Map<String, dynamic> json) =>
      _$SignupResponseFromJson(json);
}

@JsonSerializable()
class UserData {
  int? userId;
  String? firstName;
  String? lastName;
  String? email;
  String? phoneNumber;

  UserData({
    this.userId,
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
  });

   factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

}



