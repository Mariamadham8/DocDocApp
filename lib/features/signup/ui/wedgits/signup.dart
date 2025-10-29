import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mid_project/features/signup/ui/wedgits/signup_bloc_listner.dart';
import 'package:mid_project/features/signup/ui/wedgits/signup_form.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../data/models/signup_request_body.dart';
import '../../logic/signup_cubit.dart';


class signupScreen extends StatelessWidget {
  const signupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
         child: SingleChildScrollView(
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Text(
                 'Create Account',
                 style: TextStyles.font23Bluew700,
               ),
                SizedBox(height: 8),
               Text(
                 'Sign up now and start exploring all that our app has to offer. We\'re excited to welcome you to our community!',
                 style: TextStyles.font14Greyw400,
               ),
               SizedBox(height: 20),
               Column(
                 children: [
                   SignupForm(),
                    SizedBox(height: 20),
                   SizedBox(height: 40.h,),
                   ElevatedButton(
                       style: ButtonStyle(
                         fixedSize: WidgetStatePropertyAll(Size(300.w, 40.h )),
                         backgroundColor: MaterialStateProperty.all(mycolors.myBlue),
                       ),
                       onPressed:(){
                         validateonsignup(context);

                       },
                       child:Text("Login",
                         style: TextStyle(
                             color: Colors.white
                         ),
                       )
                   ),
                   SignUpListner(),
                 ],
               )
              ],
            ),
         ),
        )
      )
    );

  }
  validateonsignup(BuildContext context){
    if( context.read<SignupCubit>().formKey.currentState!.validate()){
      context.read<SignupCubit>().emitState(
        SignUpRequest(
          name: context.read<SignupCubit>().nameController.text,
          email: context.read<SignupCubit>().emailController.text,
          phone: context.read<SignupCubit>().phoneController.text,
          password: context.read<SignupCubit>().passwordController.text,
          ConfirmPassword: context.read<SignupCubit>().passwordConfirmationController.text,
          gendet: 0

        )
      );
    }

  }

}
