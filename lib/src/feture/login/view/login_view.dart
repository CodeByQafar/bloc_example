import 'package:bloc_example/src/core/extension/string_extension.dart';
import 'package:bloc_example/src/feture/login/cubit/login_cubit.dart';
import 'package:bloc_example/src/feture/login/cubit/login_cubit_state.dart';
import 'package:bloc_example/src/feture/login/service/login_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vexana/vexana.dart';

import '../../../core/Common/snackbars.dart';
import '../../../core/constants/padding.dart';
import '../../../production/model/login_response_token_model.dart';
import '../service/exceptions/login_excepton.dart';
import 'widgets/password validated filed/password_validate_filed.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _passwordformKey = GlobalKey();
  final GlobalKey<FormState> _emailformKey = GlobalKey();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  bool isPasswordInvalid = false;

  @override
  void initState() {
    super.initState();
    _emailFocusNode.addListener(() {
      if (!_emailFocusNode.hasFocus && !_emailController.text.isValidEmail) {
        _emailformKey.currentState?.validate();
      }
    });
    _passwordFocusNode.addListener(() {
      if (!_passwordFocusNode.hasFocus &&
          !_passwordController.text.isValidPassword) {
        _passwordformKey.currentState?.validate();
      }
    });
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<List<dynamic>> passwordValidationRules = [
      [
        "Password must contain at least one special character !@#%&*~",
        _passwordController.text.containAnySpecialCharacter,
      ],
      [
        "Password must contain at least one uppercase letter",
        _passwordController.text.containAnyUpperCase,
      ],
      [
        "Password must contain at least one number",
        _passwordController.text.containAnyNumber,
      ],
      [
        "Password must be at least 8 characters",
        _passwordController.text.characterCountMoreThan8,
      ],
    ];
    return SafeArea(
      child: Scaffold(
        body: BlocProvider<LoginCubit>(
          create: (context) => LoginCubit(
            LoginService(
              NetworkManager<LoginException>(
                errorModel: LoginException(),
                isEnableLogger: true,
                options: BaseOptions(
                  baseUrl: "https://identitytoolkit.googleapis.com/v1",
                ),
              ),
            ),
          ),
          child: Column(
            children: [
              Spacer(flex: 2),
              Column(
                children: [
                  Text(
                    'Login Page',
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  Padding(
                    padding: Paddings.emailTextFieldPadding,
                    child: Form(
                      key: _emailformKey,
                      child: TextFormField(
                        controller: _emailController,
                        focusNode: _emailFocusNode,
                        validator: (value) =>
                            value.isValidEmail ? null : "Invalid email",
                        onChanged: (value) {
                          if (_emailController.text.isValidEmail) {
                            _emailformKey.currentState?.validate();
                          }
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: 'Enter your email',
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: Paddings.emailTextFieldPadding,
                    child: Form(
                      key: _passwordformKey,
                      child: TextFormField(
                        controller: _passwordController,
                        focusNode: _passwordFocusNode,
                        validator: (value) =>
                            value.isValidPassword ? null : 'Invalid password',
                        onChanged: (value) {
                          setState(() {});
                          if (_passwordController.text.isValidPassword) {
                            _passwordformKey.currentState?.validate();
                          }
                        },
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          hintText: 'Enter your password',
                        ),
                      ),
                    ),
                  ),
                  isPasswordInvalid
                      ? AnimatedOpacity(
                          duration: Duration(seconds: 1),
                          opacity: isPasswordInvalid ? 1 : 0,
                          child: Column(
                            children: List.generate(
                              passwordValidationRules.length,
                              (index) => PasswordValidationFiled(
                                conditionText:
                                    passwordValidationRules[index][0],
                                isConditionValidated:
                                    passwordValidationRules[index][1],
                              ),
                            ),
                          ),
                        )
                      : SizedBox.shrink(),
                  Padding(
                    padding: Paddings.filledButtonPadding,
                    child: BlocBuilder<LoginCubit, LoginState>(
                      builder: (context, state) {
                        return FilledButton(
                          onPressed: () async {
                            if (!state.isLodaing) {
                              final bool isValidEmail =
                                  _emailController.text.isValidEmail;
                              final bool isValidPassword =
                                  _passwordController.text.isValidPassword;

                              if (!isValidEmail && isValidPassword) {
                                _emailFocusNode.requestFocus();
                              }
                             else if (isValidEmail && isValidPassword) {
                                _passwordFocusNode.requestFocus();
                              }else{
                                
                              }

                              _emailformKey.currentState!.validate();
                              if (!(_passwordformKey.currentState?.validate() ??
                                  false)) {
                                setState(() {
                                  isPasswordInvalid = true;
                                });
                              }
                              if (isValidEmail && isValidPassword) {
                                NetworkResult<
                                  LoginResponseTokenModel,
                                  INetworkModel<dynamic>
                                >
                                response = await context
                                    .read<LoginCubit>()
                                    .login(
                                      _emailController.text,
                                      _passwordController.text,
                                    );

                                if (response.isSuccess) {
                                  AppSnackbars.showSnackBar(
                                    context,
                                    'Your account created succesfully',
                                  );
                                } else {
                                  try {
                                    final error =
                                        (response
                                                as NetworkErrorResult<
                                                  LoginResponseTokenModel,
                                                  LoginException
                                                >)
                                            .error;
                                    AppSnackbars.showSnackBar(
                                      context,
                                      'Error message: ${error.model!.error!.message}',
                                    );
                                  } catch (e) {}
                                  ;
                                }
                              }
                            }
                          },

                          child: SizedBox(
                            width: 150,
                            height: 45,
                            child: Center(
                              child: state.isLodaing
                                  ? CircularProgressIndicator()
                                  : Text(
                                      'Login',
                                      style: Theme.of(
                                        context,
                                      ).textTheme.displayMedium,
                                    ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              Spacer(flex: 3),
            ],
          ),
        ),
      ),
    );
  }
}
