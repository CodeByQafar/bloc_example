import 'package:bloc_example/src/feture/login/service/login_service.dart';
import 'package:bloc_example/src/production/model/login_response_token_model.dart';
import 'package:bloc_example/src/feture/login/model/login_model.dart';
import 'package:bloc_example/src/core/service/env_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vexana/vexana.dart';
import 'dart:math' as math;

void main() async {
  await EnvService.loadEnv();
  late INetworkManager networkManager;
  late LoginService loginService;
  late LoginModel loginModel;
  setUp(()  {
    networkManager = NetworkManager<LoginResponseTokenModel>(
      options: BaseOptions(
        baseUrl: "https://identitytoolkit.googleapis.com/v1",
      ),
    );
    loginService = LoginService(networkManager);

    loginModel = LoginModel(
       'demo@example.com',
       'password123',
    );
  });
  test('Login Service test', () async {
    var response = await loginService.login(loginModel);
    print(response.data?.toJson());
    expect(response.data, isNotNull);
  });
}
