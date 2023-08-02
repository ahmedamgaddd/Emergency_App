abstract class AppStates{}
class AppInitialStates extends AppStates {}
class CreateWinchDataSuccessStates extends AppStates {}
class CreateWinchDataErrorStates extends AppStates {
  final String error;
  CreateWinchDataErrorStates(this.error);
}
class GetWinchDataSuccessStates extends AppStates {}
class GetWinchDataErrorStates extends AppStates {
  final String error;
  GetWinchDataErrorStates(this.error);
}
class GetImageSuccessStates extends AppStates {}
class GetImageErrorStates extends AppStates {}
class DoCAllPhoneSuccess extends AppStates{}
class DoCAllPhoneError extends AppStates{

}