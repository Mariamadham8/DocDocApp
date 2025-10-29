import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/signup_request_body.dart';
import '../data/repo/sigunup_repo.dart';
import 'package:mid_project/core/networking/api_result.dart';
part 'signup_state.dart';
part 'signup_cubit.freezed.dart';



class SignupCubit extends Cubit<SignupState> {

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
  TextEditingController();
  final formKey = GlobalKey<FormState>();

  SignupRepo signupRepo;
  SignupCubit(this.signupRepo) : super(const SignupState.initial(),);

  void emitState(SignUpRequest signUpRequest ) {
    emit(const SignupState.loading());
    signupRepo.registerUser(signUpRequest)
        .then((result) {
      result.when(
            success: (data) {
          emit(SignupState.success(data));
        },
            failure: (errorHandler) {
          emit(SignupState.error(
              errorHandler.apiErrorModel.message ?? "Unknown error"));
        },
      );
    });
  }

}
