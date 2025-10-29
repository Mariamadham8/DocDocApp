// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpRequest _$SignUpRequestFromJson(Map<String, dynamic> json) =>
    SignUpRequest(
      name: json['name'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      phone: json['phone'] as String,
      ConfirmPassword: json['ConfirmPassword'] as String,
      gendet: (json['gendet'] as num).toInt(),
    );

Map<String, dynamic> _$SignUpRequestToJson(SignUpRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'phone': instance.phone,
      'ConfirmPassword': instance.ConfirmPassword,
      'gendet': instance.gendet,
    };
