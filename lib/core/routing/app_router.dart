import 'package:flutter/material.dart';
import 'package:mid_project/core/routing/routes.dart';

import '../../features/login/ui/widgets/login_screen.dart';
import '../../features/onBoarding/ui/widgets/onBoarding.dart';
import '../../features/signup/ui/wedgits/signup.dart';

class AppRouter{

  Route generateRoute(RouteSettings settings){

    final arguments = settings.arguments;
    switch(settings.name){
      case  Routers.OnBoardingScreen:
        return MaterialPageRoute(
          builder: (context) =>OnBoardingScreen(),
        );
      case Routers.loginScreen:
        return MaterialPageRoute(
          builder: (context) =>loginScreen(),
        );
      case Routers.signupScreen:
        return MaterialPageRoute(
          builder: (context) =>signupScreen(),
        );
      default:
      return MaterialPageRoute(
      builder: (context) =>Scaffold(
        body: Center(
          child: Text("No route for ${settings.name}"),
        ), 
      ),
      );







    }





  }





}