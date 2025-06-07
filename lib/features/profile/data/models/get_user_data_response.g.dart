// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUserDataResponse _$GetUserDataResponseFromJson(Map<String, dynamic> json) =>
    GetUserDataResponse(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : userData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetUserDataResponseToJson(
        GetUserDataResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

userData _$userDataFromJson(Map<String, dynamic> json) => userData(
      id: json['id'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
    );

Map<String, dynamic> _$userDataToJson(userData instance) => <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
    };
