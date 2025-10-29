
import 'package:json_annotation/json_annotation.dart';
part 'signup_request_body.g.dart';

@JsonSerializable()
class SignUpRequest{
  String name;
  String email;
  String password;
  String phone;
  String ConfirmPassword;
  int gendet;
  SignUpRequest({
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
    required this.ConfirmPassword,
    required this.gendet,
  });
  Map<String, dynamic> toJson() => _$SignUpRequestToJson(this);
}