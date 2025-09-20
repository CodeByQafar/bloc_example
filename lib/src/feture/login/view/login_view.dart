import 'package:bloc_example/src/core/extension/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart' as ext;

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Spacer(flex: 2),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Text(
                    'Login Page',
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 16.0,
                      right: 16.0,
                      bottom: 16.0,
                      top: 20.0,
                    ),
                    child: TextFormField(
                      validator: (value) =>
                          value.isValidEmail ? null : "Invalid email",
                      onChanged: (value) => _formKey.currentState?.validate(),

                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(hintText: 'Enter your email'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 16.0,
                      right: 16.0,
                      bottom: 26.0,
                      top: 10.0,
                    ),
                    child: TextFormField(
                      controller: _passwordController,

                      validator: (value) {
                        if (value.isValidPassword) {
                          return null;
                        } else if (!value.characterCountMoreThan8) {
                          return "Password must be at least 8 characters";
                        } else if (!value.containAnySpecialCharacter) {
                          return "Password must contain one special character !@#%&*~";
                        } else if (!value.containAnyNumber) {
                          return "Password must contain at least one number";
                        } else if (!value.containAnyUpperCase) {
                          return "Password must contain at least one uppercase letter";
                        }
                      },
                      onChanged: (value) {
                        _formKey.currentState?.validate();
                        setState(() {
                          _passwordController.text = value;
                        });
                      },
                      keyboardType: TextInputType.visiblePassword,

                      decoration: InputDecoration(
                        hintText: 'Enter your password',
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      passwordStatement(
                        "Password must contain at least one special character !@#%&*~",
                        _passwordController.text.containAnySpecialCharacter,
                      ),
                      passwordStatement(
                        "Password must contain at least one uppercase letter",
                        _passwordController.text.containAnyUpperCase,
                      ),

                      passwordStatement(
                        "Password must contain at least one number",
                        _passwordController.text.containAnyNumber,
                      ),
                      passwordStatement(
                        " Password must be at least 8 characters",
                        _passwordController.text.characterCountMoreThan8,
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: FilledButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          print("Valid");
                        } else {
                          print("Not Valid");
                        }
                      },
                    
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24.0,
                          vertical: 12.0,
                        ),
                        child: Text(
                          'Login',
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(flex: 3),
          ],
        ),
      ),
    );
  }

  Widget passwordStatement(String text, bool isCondition) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 4),
      child: Text(
        style: Theme.of(context).textTheme.displaySmall!.copyWith(
          color: isCondition
              ? Theme.of(context).colorScheme.onTertiary
              : Theme.of(context).colorScheme.error,
        ),
        (isCondition ? '✔️' : '❌') + text,
      ),
    );
  }
}
