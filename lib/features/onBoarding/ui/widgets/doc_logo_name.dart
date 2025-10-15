import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';



class DocLogoAndName extends StatelessWidget {
   DocLogoAndName({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset("assets/svgs/Group.svg"),
        SvgPicture.asset("assets/svgs/Docdoc.svg"),
      ],
    );
  }
}
