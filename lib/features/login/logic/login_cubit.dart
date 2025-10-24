import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mid_project/core/networking/api_result.dart';

import '../data/models/request_body.dart';
import '../data/repos/login_repo.dart';
import 'login_state.dart';



class LoginCubit extends Cubit<LoginState> {
   final LoginRepo loginRepo;
  LoginCubit(this.loginRepo) : super(const LoginState.initial());


  //if the the screen is composed into different files then i can access these controllers from there once i pass the cubit to them
  TextEditingController emailController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();
   GlobalKey<FormState> formkey=GlobalKey<FormState>();





  void EmitState(LoginRequestBody loginRequestBody){
    emit(const LoginState.loading());
    loginRepo.loginUser(loginRequestBody).then((result) {
      result.when(
        success: (data) {
          emit(LoginState.success(data));
        },
        failure: (errorHandler) {
          emit(LoginState.error(errorHandler.apiErrorModel.message ?? "Unknown error"));

        },
      );
    });

  }

}
