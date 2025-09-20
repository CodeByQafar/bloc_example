import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';
part 'login_response_token_model.g.dart';

@JsonSerializable()
class LoginResponseTokenModel extends INetworkModel<LoginResponseTokenModel> {
  final String? kind;
  final String? idToken;
  final String? email;
  final String? refreshToken;
  final String? expiresIn;
  final String? localId;

  const LoginResponseTokenModel({
    this.kind,
    this.idToken,
    this.email,
    this.refreshToken,
    this.expiresIn,
    this.localId,
  });

  @override
  LoginResponseTokenModel fromJson(Map<String, dynamic> json) {
    return _$LoginResponseTokenModelFromJson(json);
  }

  @override
  Map<String, dynamic>? toJson() {
    return _$LoginResponseTokenModelToJson(this);
  }
}
