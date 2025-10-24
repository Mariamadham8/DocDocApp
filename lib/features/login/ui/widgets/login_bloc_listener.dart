import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mid_project/core/helpers/extentions.dart';

import '../../../../core/routing/routes.dart';
import '../../logic/login_cubit.dart';
import '../../logic/login_state.dart';

class LodinBlocListner extends StatelessWidget {
  const LodinBlocListner({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit,LoginState>(
     listenWhen: (previous, current) =>
     current is Loading || current is Success || current is Error,
      listener: (context,state){
        state.whenOrNull(
          loading: (){
            //show loading indicator
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
            //hide loading indicator
            Navigator.of(context).pop();
            //navigate to home screen or show success message
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Login Successful')),
            );
            context.pushNamed(Routers.homeScreen);
          },
          error: (message){
            //hide loading indicator
            Navigator.of(context).pop();
            //show error message
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Error: $message')),
            );
          },
        );
      },
      child: SizedBox.shrink()
    );
  }
}
