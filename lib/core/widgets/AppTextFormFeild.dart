
import'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/colors.dart';
import '../theming/styles.dart';


class TextFormFeild extends StatelessWidget {
  final hintText;
  final suffixIcon;
  final hintStyle;
  final obscureText;
  const TextFormFeild({super.key,this.hintText,this.hintStyle,this.obscureText,this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      decoration: InputDecoration(
        fillColor: mycolors.lightWhite,
        filled: true,
        hintText:hintText??"" ,
        suffixIcon: suffixIcon,
        hintStyle: hintStyle??TextStyles.font14Greyw100,
        isDense: true,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 18.h
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: mycolors.myBlue,
            width: 1.3
          )
        ),
        enabledBorder:OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
                color: mycolors.myLightGrey,
                width: 1.3
            )
        ),
      ),
      obscureText:  obscureText??false,
      style: TextStyles.font14DarkBluew500,

    );
  }
}
