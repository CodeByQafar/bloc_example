
import 'package:bloc_example/src/core/service/env_service.dart';
import 'package:bloc_example/src/production/model/token_model.dart';
import 'package:vexana/vexana.dart';

import '../model/login_model.dart';

class LoginService {
  final INetworkManager networkManager;

  LoginService(this.networkManager);

  Future<dynamic> login(
    LoginModel dataModel,
    TokenModel parseModel,
  ) async {
    return await networkManager.send<TokenModel, LoginModel>(
      '/accounts:signUp?key=${EnvService.token}',
      parseModel: parseModel,
      data: dataModel,
      method: RequestType.POST,
    );
  }
}
