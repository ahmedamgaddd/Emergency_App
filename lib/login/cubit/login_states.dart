abstract class LoginStates{}
class LoginInitialStates extends LoginStates {}
class LoginChangePassVisibilityStates extends LoginStates {}
class LoginSuccessStates extends LoginStates {}
class LoginLoadingStates extends LoginStates {}
class LoginErrorStates extends LoginStates {
  final String error;

  LoginErrorStates(this.error);
}
class GetUserDataSuccessStates extends LoginStates {}
class GetUserDataErrorStates extends LoginStates {
  final String error;
  GetUserDataErrorStates(this.error);
}