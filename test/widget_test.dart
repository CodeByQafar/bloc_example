import 'package:bloc_example/src/feture/login/model/login_model.dart';
import 'package:bloc_example/src/feture/login/service/login_service.dart';
import 'package:bloc_example/src/production/model/token_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vexana/vexana.dart';

void main() {
  late INetworkManager networkManager;
  late LoginService loginService;
  late LoginModel loginModel;
  setUp(() async {
    networkManager = NetworkManager<TokenModel>(
      options: BaseOptions(
        baseUrl: "https://identitytoolkit.googleapis.com/v1",
      ),
    );
    loginService = LoginService(networkManager);
    loginModel = LoginModel(
      email: 'selman@example.com',
      password: 'password123',
    );
  });
  test('test name', () async {
    var response = await loginService.login(loginModel, TokenModel());
    print(response.data);
    expect(response.data, isNotNull);
  });
}
