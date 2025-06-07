

import 'package:freezed_annotation/freezed_annotation.dart';


part 'add_new_car_response.g.dart';

@JsonSerializable()
class AddNewCarResponse {
  final String? plateNumber;
  final String? model;
  final String? type;
  final String? userId;

  AddNewCarResponse({
    this.plateNumber,
    this.model,
    this.type,
    this.userId,
  });

  factory AddNewCarResponse.fromJson(Map<String, dynamic> json) =>
      _$AddNewCarResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AddNewCarResponseToJson(this);
}