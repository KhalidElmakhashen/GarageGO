



import 'package:json_annotation/json_annotation.dart';

part 'reserve_request_body.g.dart';

@JsonSerializable()
class ReserveRequestBody {
  int garageId;
  int userId;

  ReserveRequestBody({
    required this.garageId,
    required this.userId,
  });

  Map<String, dynamic> toJson() => _$ReserveRequestBodyToJson(this);
}