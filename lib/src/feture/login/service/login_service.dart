
import 'package:bloc_example/src/feture/login/service/exceptions/login_excepton.dart';
import 'package:bloc_example/src/production/model/login_response_token_model.dart';
import 'package:bloc_example/src/core/service/env_service.dart';
import 'package:vexana/vexana.dart';
import '../model/login_model.dart';

class LoginService {
  final INetworkManager networkManager;

  LoginService(this.networkManager);

  // Future<IResponseModel<LoginResponseTokenModel, LoginException>> login(
  Future<dynamic> login(
    LoginModel dataModel,
  ) async {
   final response=await networkManager.sendRequest<LoginResponseTokenModel,LoginException>(
      '/accounts:signUp?key=${EnvService.token}',
      parseModel: LoginResponseTokenModel(),
      method: RequestType.POST,
      
      data: dataModel,
    );
      response.fold(
    onSuccess: (data) {
      // handle success case
    },
    onError: (error) {
      // handle error case
    },
  );


  // usage 3




  if (response.isError) {
    final error = (response as NetworkErrorResult<LoginException, LoginResponseTokenModel>);
  print(error.error.model!.toJson());
  }
  return response;
  }
}

