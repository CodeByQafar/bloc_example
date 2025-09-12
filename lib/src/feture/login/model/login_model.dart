
import 'package:json_serializable/json_serializable.dart';
import 'dart:convert';

@JsonSerializable()
class LoginModel {
  String email;
  String password;

  LoginModel({required this.email, required this.password});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return _$LoginModelFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$LoginModelToJson(this);
  }
}