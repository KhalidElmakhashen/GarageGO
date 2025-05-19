

import 'package:legarage/core/networking/api_error_handler.dart';
import 'package:legarage/core/networking/api_result.dart';
import 'package:legarage/core/networking/api_service.dart';

import 'package:legarage/features/explore_page/data/models/get_garage_by_id_response_body.dart';

class GetGarageByIdRepo {
  final ApiService _apiService;

  GetGarageByIdRepo(this._apiService);

  Future<ApiResult<GetGarageByIdResponse>> getGarageById(int id) async {
    try {
      final response = await _apiService.getGarageById(id);
      return ApiResult.success(response);
    } catch (errro) {
      return ApiResult.failure(ErrorHandler.handle(errro));
    }
  }
}
