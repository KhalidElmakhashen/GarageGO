


import 'package:flutter/material.dart';




@immutable
sealed class GoogleMapState {}

final class GoogleMapInitial extends GoogleMapState {}


final class GoogleMapLoading extends GoogleMapState {}

final class GoogleMapSuccess extends GoogleMapState {}

final class GoogleMapError extends GoogleMapState {
  final String errorMessage;

  GoogleMapError(this.errorMessage);
}