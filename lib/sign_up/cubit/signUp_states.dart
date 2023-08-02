abstract class SignUpStates{}
class SignUpInitialStates extends SignUpStates {}
class SignUpChangePassVisibilityStates extends SignUpStates {}
class SignUpSuccessStates extends SignUpStates {}
class SignUpLoadingStates extends SignUpStates {}
class SignUpErrorStates extends SignUpStates {
  final String error;
  SignUpErrorStates(this.error);
}

class UserCreateSuccessStates extends SignUpStates {}
class UserCreateErrorStates extends SignUpStates {
  final String error;
  UserCreateErrorStates(this.error);
}