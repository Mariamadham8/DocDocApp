import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mid_project/features/login/ui/widgets/password_validations.dart';

import '../../../../core/widgets/AppTextFormFeild.dart';
import '../../logic/login_cubit.dart';



class EmailAndPass extends StatefulWidget {
  const EmailAndPass({super.key});

  @override
  State<EmailAndPass> createState() => _EmailAndPassState();
}

class _EmailAndPassState extends State<EmailAndPass> {


  bool lowercase=false;
  bool uppercase=false ;
  bool hasnumber=false ;
  bool specialChar=false ;
  bool minLength=false ;
  bool isobscure =true;
  late TextEditingController passController;

  @override
  void initState() {
    super.initState();
    passController= context.read<LoginCubit>().PasswordController;
    setupPasswordListener();
  }
  setupPasswordListener(){
    passController.addListener(() {
      final password = passController.text;
      setState(() {
        lowercase = password.contains(RegExp(r'[a-z]'));
        uppercase = password.contains(RegExp(r'[A-Z]'));
        hasnumber = password.contains(RegExp(r'[0-9]'));
        specialChar = password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
        minLength = password.length >= 8;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formkey,
      child:Column(
        children: [
          TextFormFeild(
            controller: context.read<LoginCubit>().emailController,
              hintText: 'Email',
            validator: (value){
              if(value==null || value.isEmpty){
                return 'Please enter your email';
              }
              else if(!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}').hasMatch(value)){
                return 'Please enter a valid email';
              }
              return null;
            },

            ),
          SizedBox(height: 10,),
          TextFormFeild(
            controller: context.read<LoginCubit>().PasswordController,
              validator: (value){
                if(value==null || value.isEmpty){
                  return 'Please enter your password';
                }
                else if(value.length<8){
                  return 'Password must be at least 8 characters';
                }
                return null;
              },
            obscureText: isobscure,
              hintText: 'Password',
              suffixIcon: GestureDetector(
                onTap: (){
                  setState(() {
                    isobscure =!isobscure;
                  });
                },
                child: Icon(
                  isobscure ? Icons.visibility_off : Icons.visibility,
                ),
              ),
            ),
            SizedBox(height: 10,),
           PasswordValidation(
            lowercase: lowercase,
            uppercase: uppercase,
            hasnumber: hasnumber,
            specialChar: specialChar,
            minLength: minLength,
           ),
        ],
      ),
    );
  }
}
