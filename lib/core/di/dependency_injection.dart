import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:legarage/core/networking/api_service.dart';
import 'package:legarage/core/networking/dio_factory.dart';
import 'package:legarage/features/auth/verifing_email/data/repo/verifiy_repo.dart';
import 'package:legarage/features/auth/verifing_email/logic/verification_email_cubit.dart';
import 'package:legarage/features/current_page/data/repo/delete_reservation_repo.dart';
import 'package:legarage/features/current_page/logic/delete_reservation_cubit/delete_reservation_cubit.dart';
import 'package:legarage/features/explore_page/data/repo/get_garage_by_id_repo.dart';
import 'package:legarage/features/explore_page/data/repo/reservation_repo.dart';
import 'package:legarage/features/explore_page/logic/add_reservation_cubit/add_reservation_cubit.dart';
import 'package:legarage/features/explore_page/logic/garage_by_id_cubit/garagebyid_cubit.dart';
import 'package:legarage/features/google_map/data/repo/get_all_garages_repo.dart';
import 'package:legarage/features/google_map/logic/garages_cubit/garages_cubit.dart';

import '../../features/auth/login/data/repos/login_repo.dart';
import '../../features/auth/login/logic/cubit/login_cubit.dart';
import '../../features/auth/sign_up/data/repos/sign_up_repo.dart';
import '../../features/auth/sign_up/logic/sign_up_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  // signup
  getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt()));
  getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt()));

  // verify email
  getIt.registerLazySingleton<VerifiyRepo>(() => VerifiyRepo(getIt()));
  getIt.registerFactory<VerificationEmailCubit>(() => VerificationEmailCubit(getIt()));

  // Get all garages
  getIt.registerLazySingleton<GetAllGaragesRepo>(() => GetAllGaragesRepo(getIt()));
  getIt.registerFactory<GaragesCubit>(() => GaragesCubit(getIt()));

  // get garage by id
  getIt.registerLazySingleton<GetGarageByIdRepo>(() => GetGarageByIdRepo(getIt()));
  getIt.registerFactory<GaragebyidCubit>(() => GaragebyidCubit(getIt()));

  // reservation
  getIt.registerLazySingleton<ReservationRepo>(() => ReservationRepo(getIt()));
  getIt.registerFactory<AddReservationCubit>(() => AddReservationCubit(getIt()));

  // delete reservation
  getIt.registerLazySingleton<DeleteReservationRepo>(() => DeleteReservationRepo(getIt()));
  getIt.registerFactory<DeleteReservationCubit>(() => DeleteReservationCubit(getIt()));
  // home
  // getIt.registerLazySingleton<HomeApiService>(() => HomeApiService(dio));
  // getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()));
}
