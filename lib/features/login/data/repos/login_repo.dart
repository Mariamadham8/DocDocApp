


import 'package:mid_project/features/login/data/models/login_response.dart';

import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_services.dart';
import '../models/request_body.dart';

class LoginRepo{

  final ApiServices apiServices;

  LoginRepo(this.apiServices);

  Future<ApiResult<LoginResponse>> loginUser(LoginRequestBody requestBody) async{
    try{
      final res = await apiServices.loginUser(requestBody);
      return ApiResult.success(res);
    }
    catch(error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }

  }










}