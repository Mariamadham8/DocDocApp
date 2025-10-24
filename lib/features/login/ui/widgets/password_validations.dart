import 'package:flutter/material.dart';

class PasswordValidation extends StatefulWidget {
  final bool lowercase;
  final bool uppercase ;
  final bool hasnumber ;
  final bool specialChar ;
  final bool minLength ;
  const PasswordValidation({super.key,required this.lowercase , required this.uppercase , required this.hasnumber , required this.specialChar, required this.minLength});

  @override
  State<PasswordValidation> createState() => _PasswordValidationState();
}

class _PasswordValidationState extends State<PasswordValidation> {

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        BuildValidationRow('At least one lowercase letter',widget.lowercase),
        SizedBox(height: 2,),
        BuildValidationRow('At least one uppercase letter',widget.uppercase),
        SizedBox(height: 2,),
        BuildValidationRow('At least one hasnumber letter',widget.hasnumber),
        SizedBox(height: 2,),
        BuildValidationRow('At least one specialChar letter',widget.specialChar),
        SizedBox(height: 2,),
        BuildValidationRow('At least 8 Charcters',widget.minLength),
        SizedBox(height: 2,),




      ],
    );
  }
  BuildValidationRow(String text , bool isValid){
    return Row(
      children: [
           CircleAvatar(
            radius: 2.5,
            backgroundColor: isValid ?Colors.green : Colors.grey,
           ),
            SizedBox(width: 6,),
        Text(
          text,
          style: TextStyle(
            decoration: isValid?TextDecoration.lineThrough:null,
            decorationColor: Colors.green,
            decorationThickness: 2,
            color: isValid?Colors.green:Colors.grey,
          ),
        )
      ],
    );
  }
}
