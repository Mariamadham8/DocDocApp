import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mid_project/core/helpers/extentions.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/AppTextFormFeild.dart';




class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  bool isobscure=false;
  bool ischecked=false;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body:SafeArea(
            child :Padding(
                padding: EdgeInsets.all(30),
                child: SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children:[
                        Text("Welcome Back",
                          style: TextStyles.font23Bluew700,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text("We're excited to have you back, can't wait to see what you've been up to since you last logged in.",
                          style: TextStyles.font14Greyw100,
                        ),
                        SizedBox(
                          height: 36.h,
                        ),
                        Form(
                            child:Column(
                              children: [
                                TextFormFeild(hintText: 'Email'),
                                SizedBox(height: 10.h,),
                                TextFormFeild(
                                  hintText: 'Password',
                                  obscureText: true,
                              suffixIcon:
                                 GestureDetector(
                                   onTap: (){
                                     setState(() {
                                       isobscure =!isobscure;
                                     });
                                   },
                                    child: Icon(
                                        isobscure?Icons.visibility_off:Icons.visibility
                                    ),
                                  ),
                                ),
                                SizedBox(height: 24.h,),
                                Row(
                                  children: [
                                    TextButton(
                                        onPressed: (){

                                        },
                                        child: Text("Forget Password",
                                          style: TextStyles.font14Bluew100,
                                        )
                                    ),
                                    Spacer(),
                                    Text('Remember me'),
                                    Stack(
                                      children: [
                                        Checkbox(value: ischecked,
                                          onChanged:(bool? value){
                                            setState(() {
                                              ischecked =value!;
                                            });
                                          },
                                          shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(10)),

                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 40.h,),
                                ElevatedButton(
                                    style: ButtonStyle(
                                      fixedSize: WidgetStatePropertyAll(Size(300.w, 40.h )),
                                      backgroundColor: MaterialStateProperty.all(mycolors.myBlue),
                                    ),
                                    onPressed:(){

                                    },
                                    child:Text("Login",
                                      style: TextStyle(
                                          color: Colors.white
                                      ),
                                    )
                                ),
                                RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: '\n\nBy logging, you agree to our ',
                                        style: TextStyles.font14Greyw100,
                                      ),
                                      TextSpan(
                                        text: 'Terms & Conditions\n\n',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      TextSpan(
                                        text: 'Don\'t have an account?',
                                        style: TextStyles.font14Greyw100,
                                      ),
                                      TextSpan(
                                        text: ' Sign Up',
                                        style: TextStyles.font14Bluew100,
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            context.pushReplacementNamed(Routers.signupScreen);
                                          },
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            )
                        )
                      ]
                  ),
                )
            )
        )
    );
  }
}

