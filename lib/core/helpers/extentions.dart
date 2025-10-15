
import 'package:flutter/material.dart';


extension Navigation  on BuildContext{



Future<dynamic> pushNamed(String routename, {Object? arguments}){
  return Navigator.pushNamed(this, routename,arguments:arguments );

}


Future<dynamic> pushReplacementNamed(String routename, {Object? arguments}){
  return Navigator.pushReplacementNamed(this, routename,arguments:arguments );

}


Future<dynamic> pushAndRemoveUntil(String routename, {Object? arguments}){
  return Navigator.pushNamedAndRemoveUntil(this, routename,(route) => false,);

}

void pop()=>Navigator.pop(this);


}