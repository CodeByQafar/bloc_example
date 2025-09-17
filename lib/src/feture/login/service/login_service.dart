
import 'package:bloc_example/src/core/service/env_service.dart';
import 'package:bloc_example/src/production/model/token_model.dart';
import 'package:vexana/vexana.dart';

import '../model/login_model.dart';

class LoginService {
  final INetworkManager networkManager;

  LoginService(this.networkManager);

  Future<IResponseModel<TokenModel?, INetworkModel<dynamic>?>> login(
    LoginModel dataModel,
  ) async {
    return await networkManager.send<TokenModel,TokenModel>(
      '/accounts:signUp?key=${EnvService.token}',
      method: RequestType.POST,
      parseModel: TokenModel(),
      data: dataModel,
    );
  }
}
