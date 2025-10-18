import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theming/styles.dart';
import 'doc_logo_name.dart';
import '../../../../core/helpers/extentions.dart';


class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child:Padding(
              padding: EdgeInsets.only(top: 30.h),
            child: Column(
              children:[
                DocLogoAndName(),
                SizedBox(height: 10.h,),
                Stack(
                  children: [
                    SvgPicture.asset("assets/svgs/LogoBack.svg"),
                    Container(
                     child: Image(image: AssetImage("assets/images/Image.png")),
                      foregroundDecoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              Colors.white,
                              Colors.white.withOpacity(0.0),
                            ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          stops: [.14,0.4],
                        )
                      ),
                    ),
                    Positioned(
                      bottom: 30.h,
                        left: 0.h,
                        right: 0.h,
                        child:Text("Best Doctor\nAppointment App",
                          textAlign: TextAlign.center,
                          style: TextStyles.font32Blue700Bold.copyWith(
                            height:1.4.h,
                          ),
                        )
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.h),
                  child: Column(
                    children: [
                      Text("Manage and schedule all of your medical appointments easily with Docdoc to get a new experience.",
                        style:TextStyles.font14Greyw400 ,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 5.h,),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: (){
                            context.pushNamed(Routers.loginScreen);

                          },
                          child: Text("Get Started",style: TextStyle(color: Colors.white),),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.blue) ,
                          ),
                        ),
                      )

                    ],
                  ),
                )

              ]
            )  ,

          )
      ),
    );
  }
}
