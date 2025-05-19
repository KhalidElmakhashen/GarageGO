
import 'package:freezed_annotation/freezed_annotation.dart';

part  'verification_email_state.freezed.dart';




@freezed
class VerificationEmailState<T> with _$VerificationEmailState<T> {
  const factory VerificationEmailState.initial() = _Initial;
  const factory VerificationEmailState.verificationEmailLoading() = VerificationEmailLoading;
  const factory VerificationEmailState.verificationEmailSuccess(T data) = VerificationEmailSuccess<T>;
  const factory VerificationEmailState.verificationEmailError({required String error}) = VerificationEmailError;
}

