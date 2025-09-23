import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';
part 'login_excepton.g.dart';

@JsonSerializable()
class LoginException extends INetworkModel<LoginException> {
  final Error error;
  const LoginException(this.error);
  @override
  LoginException fromJson(Map<String, dynamic> json) {
    return _$LoginExceptionFromJson(json);
  }

  @override
  Map<String, dynamic>? toJson() {
    return _$LoginExceptionToJson(this);
  }
}

class ErrorModel {
  Error? error;

  ErrorModel(this.error);

  ErrorModel.fromJson(Map<String, dynamic> json) {
    error = json['error'] != null ? Error.fromJson(json['error']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (error != null) {
      data['error'] = error!.toJson();
    }
    return data;
  }
}

class Error {
  int? code;
  String? message;
  List<Errors>? errors;

  Error({this.code, this.message, this.errors});

  Error.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['errors'] != null) {
      errors = <Errors>[];
      json['errors'].forEach((v) {
        errors!.add(Errors.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;
    if (errors != null) {
      data['errors'] = errors!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Errors {
  String? message;
  String? domain;
  String? reason;

  Errors({this.message, this.domain, this.reason});

  Errors.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    domain = json['domain'];
    reason = json['reason'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['domain'] = domain;
    data['reason'] = reason;
    return data;
  }
}
