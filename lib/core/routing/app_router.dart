import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mid_project/core/routing/routes.dart';

import '../../features/home/home_screen.dart';
import '../../features/login/logic/login_cubit.dart';
import '../../features/login/ui/widgets/login_screen.dart';
import '../../features/onBoarding/ui/widgets/onBoarding.dart';
import '../../features/signup/ui/wedgits/signup.dart';
import '../di/dependency_injection.dart';

class AppRouter {

  Route generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case Routers.OnBoardingScreen:
        return MaterialPageRoute(
          builder: (context) => OnBoardingScreen(),
        );
      case Routers.loginScreen:
        return MaterialPageRoute(
          builder: (context) =>
              BlocProvider(
                create: (context) => getit<LoginCubit>(),
                child: loginScreen(),
              ),
        );
      case Routers.signupScreen:
        return MaterialPageRoute(
          builder: (context) => signupScreen(),
        );
      case Routers.homeScreen:
        return MaterialPageRoute(
          builder: (context) => homeScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) =>
              Scaffold(
                body: Center(
                  child: Text("No route for ${settings.name}"),
                ),
              ),
        );
    }
  }


}