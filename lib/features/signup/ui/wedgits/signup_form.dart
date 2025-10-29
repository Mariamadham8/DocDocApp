import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/AppTextFormFeild.dart';
import '../../logic/signup_cubit.dart';



class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  bool isPasswordObscureText = true;
  bool isPasswordConfirmationObscureText = true;

  bool hasLowercase = false;
  bool hasUppercase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;
  late TextEditingController passwordController;
  @override
  initState() {
    super.initState();
    passwordController = context.read<SignupCubit>().passwordController;
     SetPasswordListener();
  }

  SetPasswordListener(){
    passwordController.addListener(() {
      final password = passwordController.text;
      setState(() {
        hasLowercase = password.contains(RegExp(r'[a-z]'));
        hasUppercase = password.contains(RegExp(r'[A-Z]'));
        hasSpecialCharacters = password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
        hasNumber = password.contains(RegExp(r'[0-9]'));
        hasMinLength = password.length >= 8;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Form(
      child: Column(
        children: [
          TextFormFeild(
            controller:  context.read<SignupCubit>().nameController,
              hintText: 'Username',

          ),
          SizedBox(height: 16,),
          TextFormFeild(
              hintText: 'Email',
            controller:  context.read<SignupCubit>().emailController,

          ),
          SizedBox(height: 16,),
          TextFormFeild(
            controller:  context.read<SignupCubit>().passwordController,
            hintText: 'Password',
            obscureText: isPasswordObscureText,
              suffixIcon: GestureDetector(
                  onTap: () {
                  setState(() {
                  isPasswordObscureText = !isPasswordObscureText;
                  });
              },
              child: Icon(
                    isPasswordObscureText ? Icons.visibility_off : Icons.visibility,
              ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a valid password';
                }
              },
          ),
          SizedBox(height: 16,),
          TextFormFeild(
          controller:  context.read<SignupCubit>().passwordConfirmationController,
            obscureText: true,
              hintText: 'Confirm Password',
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isPasswordObscureText = !isPasswordObscureText;
                });
              },
              child: Icon(
                isPasswordObscureText ? Icons.visibility_off : Icons.visibility,
              ),
            ),
            ),
          SizedBox(height: 16,),
          TextFormFeild(
            controller:  context.read<SignupCubit>().phoneController,
            obscureText: true,
            hintText: 'Phone Number',
          ),


        ],
      ),
    );
  }
}
