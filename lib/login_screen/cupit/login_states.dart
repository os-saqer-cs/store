import '../../model/login_model.dart';

abstract class LogInStates{}
class LogInInitialState extends LogInStates{}
class LogInLoadingState extends LogInStates{}
class LogInSuccessState extends LogInStates{
  LoginModel? model;
  LogInSuccessState(this.model);
}
class LogInErrorState extends LogInStates{}