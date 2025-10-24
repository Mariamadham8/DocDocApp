


import 'package:retrofit/error_logger.dart';

import '../../features/login/data/models/login_response.dart';
import 'api_const.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
part 'api_services.g.dart';


@RestApi(baseUrl:ApiConstants.apiBaseUrl)
abstract class ApiServices{

factory ApiServices(Dio dio,{String baseUrl})=_ApiServices;

@POST(ApiConstants.login)
Future<LoginResponse> loginUser(@Body() LoginRequestBody);



}