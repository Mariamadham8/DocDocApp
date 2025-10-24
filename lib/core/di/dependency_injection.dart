

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:mid_project/core/networking/api_services.dart';
import 'package:mid_project/core/networking/dio_factory.dart';

import '../../features/login/data/repos/login_repo.dart';
import '../../features/login/logic/login_cubit.dart';

final getit=GetIt.instance;


void setupDI(){
     Dio dio=DioFactory.getDio();
      getit.registerLazySingleton<ApiServices>(()=>ApiServices(dio));

      getit.registerLazySingleton<LoginRepo>(()=>LoginRepo(getit<ApiServices>()));
      getit.registerLazySingleton<LoginCubit>(()=>LoginCubit(getit<LoginRepo>()));
}