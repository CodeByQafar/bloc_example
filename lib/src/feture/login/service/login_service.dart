import 'package:bloc_example/src/production/model/token_model.dart';
import 'package:vexana/vexana.dart';

class LoginService {

  final INetworkManager networkManager;

  LoginService(this.networkManager);

  Future<TokenModel?> login(LoginModel model)async{
    return await networkManager.send(path, parseModel: parseModel, method: method)
  }
}

