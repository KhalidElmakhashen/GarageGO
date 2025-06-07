



import 'package:legarage/core/networking/api_error_handler.dart';
import 'package:legarage/core/networking/api_result.dart';
import 'package:legarage/core/networking/api_service.dart';
import 'package:legarage/features/profile/data/models/get_user_data_response.dart';

class GetUserDataRepo {
  final ApiService _apiService;

  GetUserDataRepo(this._apiService);

  Future<ApiResult<GetUserDataResponse>> getUserData(int id) async {
    try {
      final response = await _apiService.getUserdata(id);
      return ApiResult.success(response);
    } catch (errro) {
      return ApiResult.failure(ErrorHandler.handle(errro));
    }
  }
}
