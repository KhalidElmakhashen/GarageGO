


import 'package:legarage/core/networking/api_error_handler.dart';
import 'package:legarage/core/networking/api_result.dart';
import 'package:legarage/core/networking/api_service.dart';
import 'package:legarage/features/profile/data/models/get_cars_response.dart';

class GetCarsRepo {
  ApiService _apiService;
  GetCarsRepo(this._apiService);

  Future<ApiResult<GetCarsResponse>> getCars(int userId) async {
    try {
      final Response = await _apiService.getCarByUserId(userId);
      return ApiResult.success(Response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}