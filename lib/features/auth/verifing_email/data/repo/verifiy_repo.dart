

import 'package:legarage/core/networking/api_error_handler.dart';
import 'package:legarage/core/networking/api_result.dart';
import 'package:legarage/core/networking/api_service.dart';
import 'package:legarage/features/auth/verifing_email/data/models/verification_email_request_body.dart';
import 'package:legarage/features/auth/verifing_email/data/models/verification_email_response.dart';

class VerifiyRepo {
  ApiService _apiService;
  VerifiyRepo(this._apiService);

  Future<ApiResult<VerificationEmailResponse>> verifyEmail(VerificationEmailRequestBody verificatoinEmailRequestBody) async {
    try {
      final response = await _apiService.verifyEmail(verificatoinEmailRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}