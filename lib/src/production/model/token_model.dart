import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';
part 'token_model.g.dart';

@JsonSerializable()
class TokenModel extends INetworkModel<TokenModel> {
  final String? kind;
  final String? idToken;
  final String? email;
  final String? refreshToken;
  final String? expiresIn;
  final String? localId;

 const TokenModel({
    this.kind,
    this.idToken,
    this.email,
    this.refreshToken,
    this.expiresIn,
    this.localId,
  });

  @override
  TokenModel fromJson(Map<String, dynamic> json) {
    return _$TokenModelFromJson(json);
  }

  @override
  Map<String, dynamic>? toJson() {
    return _$TokenModelToJson(this);
  }
}
