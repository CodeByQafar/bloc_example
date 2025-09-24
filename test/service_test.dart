// import 'dart:nativewrappers/_internal/vm/lib/math_patch.dart' hide log;

import 'package:bloc_example/src/feture/login/service/exceptions/login_excepton.dart';
import 'package:bloc_example/src/feture/login/service/login_service.dart';
import 'package:bloc_example/src/production/model/login_response_token_model.dart';
import 'package:bloc_example/src/feture/login/model/login_model.dart';
import 'package:bloc_example/src/core/service/env_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vexana/vexana.dart';
import 'dart:math' as math;
import 'dart:developer';

void main() async {
  await EnvService.loadEnv();
  late INetworkManager networkManager;
  late LoginService loginService;
  late LoginModel loginModel;
  setUp(() {
    networkManager = NetworkManager<LoginException>(
      errorModel: LoginException(),
      options: BaseOptions(
        baseUrl: "https://identitytoolkit.googleapis.com/v1",
      ),
    );
    loginService = LoginService(networkManager);

    loginModel = LoginModel(
      'demaw${math.Random().nextInt(10000)}@example.com',
      'password123',
    );
  });
  test('Login Service Succses test', () async {
    final response = await loginService.login(loginModel);
    expect(response, isNotNull);
    if (response.isSuccess) {
      final data =
          (response
                  as NetworkSuccessResult<
                    LoginResponseTokenModel,
                    LoginException
                  >)
              .data;
      expect(data, isNotNull);
    } else {
      final error =
          (response
                  as NetworkErrorResult<
                    LoginResponseTokenModel,
                    LoginException
                  >)
              .error;
      expect(error, isNotNull);
    }
  });
}
