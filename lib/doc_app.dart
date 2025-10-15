import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';
import 'core/theming/colors.dart';
class DocApp extends StatelessWidget {
  final AppRouter appRouter;
  const DocApp({super.key,required this.appRouter});

  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
      designSize: Size(375, 812 ),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor:mycolors.myBlue,
          scaffoldBackgroundColor: Colors.white
        ),
        initialRoute: Routers.OnBoardingScreen,
        onGenerateRoute: appRouter.generateRoute ,
      ),
    );
  }
}
