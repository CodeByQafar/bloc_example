// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokenModel _$TokenModelFromJson(Map<String, dynamic> json) => TokenModel(
  kind: json['kind'] as String?,
  idToken: json['idToken'] as String?,
  email: json['email'] as String?,
  refreshToken: json['refreshToken'] as String?,
  expiresIn: json['expiresIn'] as String?,
  localId: json['localId'] as String?,
);

Map<String, dynamic> _$TokenModelToJson(TokenModel instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'idToken': instance.idToken,
      'email': instance.email,
      'refreshToken': instance.refreshToken,
      'expiresIn': instance.expiresIn,
      'localId': instance.localId,
    };
