


import 'package:legarage/core/networking/api_error_handler.dart';
import 'package:legarage/core/networking/api_result.dart';
import 'package:legarage/core/networking/api_service.dart';
import 'package:legarage/features/google_map/data/models/get_all_garages_response_body.dart';

class GetAllGaragesRepo {
  final ApiService _apiService;

  GetAllGaragesRepo(this._apiService);

  Future<ApiResult<GetAllGaragesResponse>> getAllGarages() async {
    try {
      final response = await _apiService.getAllGarages();
      return ApiResult.success(response);
    } catch (errro) {
      return ApiResult.failure(ErrorHandler.handle(errro));
    }
  }
}
