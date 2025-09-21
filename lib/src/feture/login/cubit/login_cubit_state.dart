import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  final bool isLodaing;
  final bool isformDataValid;

 const LoginState({this.isLodaing = false, this.isformDataValid = false});
  @override
  List<Object?> get props => [isLodaing, isformDataValid];

  LoginState copyWith({bool? isLodaing, bool? isformDataValid}) {
    return LoginState(
      isLodaing: isLodaing ?? false,
      isformDataValid: isformDataValid ?? false,
    );
  }
}
