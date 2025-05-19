

import 'package:json_annotation/json_annotation.dart';

part 'delete_reservation_response.g.dart';

@JsonSerializable()
class  DeleteReservationResponse {
  final String? message;
  final bool? status;
  final ResponseData? data;

  DeleteReservationResponse({
    required this.message,
    required this.status,
    required this.data,
  });

  factory DeleteReservationResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteReservationResponseFromJson(json);


  
}

@JsonSerializable()
class ResponseData {
  int? userId;
  int? garageId;

  ResponseData({
    required this.userId,
    required this.garageId,
  }); 

  factory ResponseData.fromJson(Map<String, dynamic> json) =>
      _$ResponseDataFromJson(json); 
}