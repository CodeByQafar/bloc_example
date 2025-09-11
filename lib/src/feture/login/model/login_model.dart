
import 'package:json_serializable/json_serializable.dart';
import 'dart:convert';

@JsonSerializable()
class LoginModel {
  String email;
  String password;

  LoginModel({required this.email, required this.password});
}
