import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:legarage/core/helpers/constants.dart';
import 'package:legarage/core/helpers/shared_pref_helper.dart';
import 'package:legarage/core/networking/dio_factory.dart';

import 'package:legarage/features/auth/login/data/models/login_request_body.dart';
import 'package:legarage/features/auth/login/data/repos/login_repo.dart';
import 'package:legarage/features/auth/login/logic/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(const LoginState.initial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitLoginStates() async {
    emit(const LoginState.loading());
    final response = await _loginRepo.login(
      LoginRequestBody(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
    response.when(success: (loginResponse) async {
      await saveUserId(loginResponse.userData!.userId ?? 0);
      await saveUserToken(loginResponse.userData?.token ?? '');
      emit(LoginState.success(loginResponse));
    }, failure: (error) {
      emit(LoginState.error(error: error.apiErrorModel.message ?? ''));
    });
  }
  Future<void> saveUserToken(String token) async {
    await SharedPrefHelper.setSecuredString(SharedPrefKeys.userToken, token);
    DioFactory.setTokenIntoHeaderAfterLogin(token);
  }
     Future<void> saveUserId(int id) async {
    await SharedPrefHelper.setSecuredString(SharedPrefKeys.userId, id.toString());
  }
}
