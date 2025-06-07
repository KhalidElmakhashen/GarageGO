


import 'package:legarage/core/networking/api_error_handler.dart';
import 'package:legarage/core/networking/api_result.dart';
import 'package:legarage/core/networking/api_service.dart';
import 'package:legarage/features/onboarding/data/models/add_new_car_request.dart';
import 'package:legarage/features/onboarding/data/models/add_new_car_response.dart';

class AddNewCarRepo {
  
  ApiService _apiService;
  AddNewCarRepo(this._apiService);

  Future<ApiResult<AddNewCarResponse>> addNewCar(
      AddNewCarRequest addNewCarRequest) async {
    try {
      final response = await _apiService.addNewCar(addNewCarRequest);
      return ApiResult.success(response);
    } catch (errro) {
      return ApiResult.failure(ErrorHandler.handle(errro));
    }
  }
}
