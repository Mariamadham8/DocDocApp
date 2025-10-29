import'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mid_project/core/helpers/extentions.dart';

import '../../../../core/routing/routes.dart';
import '../../logic/signup_cubit.dart';

class SignUpListner extends StatelessWidget {
  const SignUpListner({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit,SignupState>(
      listenWhen:(previous, current) {
        return current is Loading || current is Success || current is Error;
      },
      listener:(context, state) {
        state.whenOrNull(
          loading: (){
            // Show loading indicator
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            );
          },
          success: (data){
            // Hide loading indicator
            Navigator.of(context).pop();
            // Show success message
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Signup Successful')),
            );
            context.pushNamed(Routers.signupScreen);
          },
          error: (message){
            // Hide loading indicator
            Navigator.of(context).pop();
            // Show error message
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Error: $message')),
            );
          },
        );
      } ,
      child: SizedBox.shrink(),

    );
  }
}
