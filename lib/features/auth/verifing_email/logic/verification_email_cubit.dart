
import 'package:bloc/bloc.dart';
import 'package:legarage/core/helpers/constants.dart';
import 'package:legarage/core/helpers/shared_pref_helper.dart';
import 'package:legarage/features/auth/verifing_email/data/models/verification_email_request_body.dart';
import 'package:legarage/features/auth/verifing_email/data/repo/verifiy_repo.dart';

import 'verification_email_state.dart';
// import 'package:legarage/features/verifing_email/logic/verification_email_state.dart';



class VerificationEmailCubit extends Cubit<VerificationEmailState> {
  VerifiyRepo _verifiyRepo;
  VerificationEmailCubit(this._verifiyRepo) : super(VerificationEmailState.initial());

  int userId = 0;

  void emitVerificationState ({required String verificationCode}) async {
    emit(VerificationEmailState.verificationEmailLoading());
    await getUserId();
    final response = await _verifiyRepo.verifyEmail(VerificationEmailRequestBody(id: userId, code: verificationCode));
    response.when(success: (verificationEmailResponse) {
      emit(VerificationEmailState.verificationEmailSuccess(verificationEmailResponse));
    }, failure: (error) {
      emit(VerificationEmailState.verificationEmailError(error: error.apiErrorModel.message ?? ''));
    });
  }


  Future<void> getUserId() async{
    String id = await SharedPrefHelper.getSecuredString(SharedPrefKeys.userId);
    userId = int.parse(id);
  }
  

}
