// ignore_for_file: public_member_api_docs, sort_constructors_first



import 'package:json_annotation/json_annotation.dart';

part 'reserve_response.g.dart';

@JsonSerializable()
class ReserveResponse { bool? status;
 String? message;
ResponseData? data;
  
  ReserveResponse({this.status, this.message, this.data});

  factory ReserveResponse.fromJson(Map<String, dynamic> json) =>
      _$ReserveResponseFromJson(json);
}


@JsonSerializable()
class ResponseData {
   int reservationRecordId;
   String startDate;
   String endDate;

  ResponseData({
    required this.reservationRecordId,
    required this.startDate,
    required this.endDate,
  });



     factory ResponseData.fromJson(Map<String, dynamic> json) =>
      _$ResponseDataFromJson(json);

}
