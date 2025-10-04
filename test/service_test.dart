// import 'dart:nativewrappers/_internal/vm/lib/math_patch.dart' hide log;

import 'package:bloc_example/src/feture/login/service/exceptions/login_excepton.dart';
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
  late LoginModel succsesfulLoginModel;
  late LoginModel unSuccsesfulLoginModel;

  setUp(() {
    networkManager = NetworkManager<LoginException>(
      errorModel: LoginException(),
      options: BaseOptions(
        baseUrl: "https://identitytoolkit.googleapis.com/v1",
      ),
    );

    loginService = LoginService(networkManager);

    succsesfulLoginModel = LoginModel(
      '${math.Random().nextInt(10000)}demo${math.Random().nextInt(10000)}@example.com',
      'password${math.Random().nextInt(10000)}',
    );
    unSuccsesfulLoginModel = LoginModel('demo@example.com', 'password123');
  });
  group('Login succsesful and unsuccsesful response test', () {
    // test('Login Service Succses test', () async {
    //   final response =
    //       await loginService.login(succsesfulLoginModel) as NetworkSuccessResult<LoginResponseTokenModel, LoginException>;
    //   expect(response.isSuccess, true);
    // });

    // test('Login Service error test', () async {
    //   final response =
    //       await loginService.login(unSuccsesfulLoginModel) as NetworkErrorResult<LoginException, LoginException>;
    //   expect(response.isError, true);
    // });
  });
}

