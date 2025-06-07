

import 'package:freezed_annotation/freezed_annotation.dart';
part 'add_new_car_request.g.dart';
@JsonSerializable()
class AddNewCarRequest {
  final String? plateNumber;
  final String? model;
  final String? type;
  final String? userId;

  AddNewCarRequest({
    this.plateNumber,
    this.model,
    this.type,
    this.userId,
  });

  factory AddNewCarRequest.fromJson(Map<String, dynamic> json) =>
      _$AddNewCarRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AddNewCarRequestToJson(this);
}