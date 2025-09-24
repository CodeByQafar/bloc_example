// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_excepton.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginException _$LoginExceptionFromJson(Map<String, dynamic> json) =>
    LoginException(
      error: json['error'] == null
          ? null
          : Error.fromJson(json['error'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginExceptionToJson(LoginException instance) =>
    <String, dynamic>{'error': instance.error};
