// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response_token_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponseTokenModel _$LoginResponseTokenModelFromJson(
  Map<String, dynamic> json,
) => LoginResponseTokenModel(
  kind: json['kind'] as String?,
  idToken: json['idToken'] as String?,
  email: json['email'] as String?,
  refreshToken: json['refreshToken'] as String?,
  expiresIn: json['expiresIn'] as String?,
  localId: json['localId'] as String?,
);

Map<String, dynamic> _$LoginResponseTokenModelToJson(
  LoginResponseTokenModel instance,
) => <String, dynamic>{
  'kind': instance.kind,
  'idToken': instance.idToken,
  'email': instance.email,
  'refreshToken': instance.refreshToken,
  'expiresIn': instance.expiresIn,
  'localId': instance.localId,
};
