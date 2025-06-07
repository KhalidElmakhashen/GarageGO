import 'package:dio/dio.dart';
import 'package:legarage/core/networking/api_constants.dart';
import 'package:legarage/features/auth/login/data/models/login_request_body.dart';
import 'package:legarage/features/auth/login/data/models/login_response.dart';
import 'package:legarage/features/auth/verifing_email/data/models/verification_email_request_body.dart';
import 'package:legarage/features/auth/verifing_email/data/models/verification_email_response.dart';
import 'package:legarage/features/current_page/data/models/delete_reservation_response.dart';
import 'package:legarage/features/explore_page/data/models/get_garage_by_id_response_body.dart';
import 'package:legarage/features/explore_page/data/models/reserve_request_body.dart';
import 'package:legarage/features/explore_page/data/models/reserve_response.dart';
import 'package:legarage/features/google_map/data/models/get_all_garages_response_body.dart';
import 'package:legarage/features/onboarding/data/models/add_new_car_request.dart';
import 'package:legarage/features/onboarding/data/models/add_new_car_response.dart';
import 'package:legarage/features/profile/data/models/get_user_data_response.dart';
import 'package:retrofit/retrofit.dart';
import '../../features/auth/sign_up/data/models/sign_up_request_body.dart';
import '../../features/auth/sign_up/data/models/sign_up_response.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.login)
  Future<LoginResponse> login(
    @Body() LoginRequestBody loginRequestBody,
  );

  @POST(ApiConstants.signup)
  Future<SignupResponse> signup(
    @Body() SignupRequestBody signupRequestBody,
  );

  @POST(ApiConstants.verifyEmail)
  Future<VerificationEmailResponse> verifyEmail(
    @Body() VerificationEmailRequestBody verificationEmailRequestBody,
  );

  @GET(ApiConstants.getAllGarages)
  Future<GetAllGaragesResponse> getAllGarages();

  @GET(ApiConstants.getGarageById)
    Future<GetGarageByIdResponse> getGarageById(
      @Path('id') int garageId,
    );

  @POST(ApiConstants.addReservationRecord)
    Future<ReserveResponse> addReservation(
      @Body() ReserveRequestBody reservationRequestBody,
    );

  @DELETE(ApiConstants.deleteReservationRecord)
    Future<DeleteReservationResponse> deleteReservation(
      @Path('id') int reservationId,
    );

  @GET(ApiConstants.getUserById)
    Future<GetUserDataResponse> getUserdata(
      @Path('id') int userId,
    );

  @POST(ApiConstants.addNewCar)
  Future<AddNewCarResponse> addNewCar(
    @Body() AddNewCarRequest carData,
  );

}
