



import 'package:legarage/core/networking/api_error_handler.dart';
import 'package:legarage/core/networking/api_result.dart';
import 'package:legarage/core/networking/api_service.dart';
import 'package:legarage/features/explore_page/data/models/reserve_request_body.dart';
import 'package:legarage/features/explore_page/data/models/reserve_response.dart';

class ReservationRepo {
  final ApiService _apiService;

  ReservationRepo(this._apiService);

  Future<ApiResult<ReserveResponse>> addReservation(int userId, int garageId) async {
    try {
      final response = await _apiService.addReservation(
        ReserveRequestBody(garageId: garageId, userId: userId)
      );
      return ApiResult.success(response);
    } catch (errro) {
      return ApiResult.failure(ErrorHandler.handle(errro));
    }
  }
}
