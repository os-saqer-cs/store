 import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/onpoarding_Screen/cupit/onboardingstatus.dart';

 class OnBoardingCupit extends   Cubit<OnBoardingStatus>{
  OnBoardingCupit():super(OnBoardingInitialState());
 static OnBoardingCupit get(context)=>BlocProvider.of(context);
 bool isLast = false;
 late int index ;



  void ChangeIndex(int indexx){
   index = indexx;

   emit(OnBoardingChangeIndex());
  }

  void Changebool( ){
   isLast = !isLast;

   emit(OnBoardingChangeIsLast());
  }

}