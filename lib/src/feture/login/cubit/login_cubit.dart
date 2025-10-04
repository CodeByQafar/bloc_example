import 'package:bloc_example/src/feture/login/cubit/login_cubit_state.dart';
import 'package:bloc_example/src/feture/login/model/login_model.dart';
import 'package:bloc_example/src/feture/login/service/login_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vexana/vexana.dart';

import '../../../production/model/login_response_token_model.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(LoginService loginService)
    : _loginService = loginService,
      super(LoginState());
  final LoginService _loginService;
  Future<NetworkResult<LoginResponseTokenModel, INetworkModel<dynamic>>> login(
    String email,
    String password,
  ) async {
    emit(state.copyWith(isLodaing: true));
    final response = await _loginService.login(LoginModel(email, password));
    emit(state.copyWith(isLodaing: false));
    return response;
  }
}
