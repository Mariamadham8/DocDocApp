

import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_services.dart';
import '../models/signup_request_body.dart';
import '../models/signup_response.dart';

class SignupRepo{
  ApiServices apiServices ;
  SignupRepo( this.apiServices);
  
Future<ApiResult<SignUpResponse>>registerUser(SignUpRequest signUpRequestBody)async{
  try{
    final response = await apiServices.registerUser(signUpRequestBody);
    return ApiResult.success(response);
  }
  catch(error){
    return ApiResult.failure(ErrorHandler.handle(error));
  }
}

  





}