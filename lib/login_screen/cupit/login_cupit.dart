import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/Network/dio_helper/dio_helper.dart';
import 'package:store/login_screen/cupit/login_states.dart';

import '../../model/login_model.dart';

class LogInCubit extends Cubit<LogInStates>{
  LogInCubit():super(LogInInitialState());
  static LogInCubit get(context)=>BlocProvider.of(context);

  LoginModel? model;
  void postLogIn({required String phone,required String password}){
    emit(LogInLoadingState());
    DioHelper.PostData(url: 'account/token/',query: null,data: {
      'mobile_number':phone.toString(),
      'password' : password.toString()
    })!.then((value) {
      model = LoginModel.formjson(value.data);
      print(model?.data?.access.toString());
      emit(LogInSuccessState(model));

    }).catchError((e){
emit(LogInErrorState());
      print(e.toString());
    });
    
  }
}