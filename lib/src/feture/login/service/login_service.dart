import 'package:bloc_example/src/feture/login/service/exceptions/login_excepton.dart';
import 'package:bloc_example/src/production/model/login_response_token_model.dart';
import 'package:bloc_example/src/core/service/env_service.dart';
import 'package:vexana/vexana.dart';
import '../model/login_model.dart';
import 'package:fpdart/fpdart.dart';

class LoginService {
  final INetworkManager networkManager;

  LoginService(this.networkManager);

  Future<NetworkResult<LoginResponseTokenModel, INetworkModel<dynamic>>> login(
    // Future<dynamic> login(
    LoginModel dataModel,
  ) async {
    final response = await networkManager
        .sendRequest<LoginResponseTokenModel, LoginException>(
          '/accounts:signUp?key=${EnvService.token}',
          parseModel: LoginResponseTokenModel(),
          method: RequestType.POST,
          data: dataModel,
        );
    if (response.isSuccess) {
      return response
          as NetworkSuccessResult<LoginResponseTokenModel, LoginResponseTokenModel>;
    } else {
      return response
          as NetworkErrorResult<LoginResponseTokenModel, LoginException>;
    }
  }
}
