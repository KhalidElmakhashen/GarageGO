


import 'package:freezed_annotation/freezed_annotation.dart';

part "get_garage_by_Id_request_body.g.dart";

@JsonSerializable()
class GetGarageByIdRequestBody {
  int garageId;

  GetGarageByIdRequestBody({
    required this.garageId,
  });

  Map<String, dynamic> toJson() => _$GetGarageByIdRequestBodyToJson(this);
}