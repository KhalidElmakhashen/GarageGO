


import 'package:legarage/core/networking/api_error_handler.dart' show ErrorHandler;
import 'package:legarage/core/networking/api_result.dart';
import 'package:legarage/core/networking/api_service.dart';
import 'package:legarage/features/current_page/data/models/delete_reservation_response.dart';


class DeleteReservationRepo {
  final ApiService _apiService;

  DeleteReservationRepo(this._apiService);

  Future<ApiResult<DeleteReservationResponse>> deleteReservationRecord(int id) async {
    try {
      final response = await _apiService.deleteReservation(id);
      return ApiResult.success(response);
    } catch (errro) {
      return ApiResult.failure(ErrorHandler.handle(errro));
    }
  }
}
