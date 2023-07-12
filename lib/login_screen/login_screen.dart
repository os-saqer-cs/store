
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:store/done_screen/done_screen.dart';
import 'package:store/login_screen/cupit/login_cupit.dart';
import 'package:store/login_screen/cupit/login_states.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var phone = TextEditingController();
    var password = TextEditingController();
    var formkey = GlobalKey<FormState>();
    return BlocProvider(
      create: (context)=>LogInCubit(),
      child: BlocConsumer<LogInCubit,LogInStates>(
        listener: (context,state){
          if(state is LogInSuccessState){

            if((LogInCubit.get(context).model?.status)!){
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DoneScreen(),
                  ),
                      (route) => false);
            }
            
          }

        },
        builder: (context,state){
          var cupit = LogInCubit.get(context);
          return Scaffold(

            body:Column(
              children: [
                Expanded(child: Container(

                  decoration: BoxDecoration(
                      image: DecorationImage(image:AssetImage('images/on_poarding.png')),
                      color: Colors.indigo,
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(50.0),bottomLeft: Radius.circular(50.0,))
                  ),

                )),
                Expanded(child: SingleChildScrollView(
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Form(
                        key: formkey,
                        child: Column(children: [
                          Container(
                            height: 50.0,
                            child: TextFormField(
                              keyboardType: TextInputType.phone,
                              controller: phone,
                              validator: ( value){
                                if(value!.isEmpty){
                                  return 'الرجاء ادخال رقم الهاتف ';

                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                prefix: Icon(Icons.phone),
                                border: OutlineInputBorder(),
                                labelText: 'رقم الهاتف المحمول',


                              ),
                            ),
                          ),
                          SizedBox(height: 30.0,),
                          Container(
                            height: 50.0,
                            decoration: BoxDecoration(

                            ),
                            child: TextFormField(

                              keyboardType: TextInputType.visiblePassword,
                              controller: password,
                              validator: ( value){
                                if(value!.isEmpty){
                                  return 'الرجاء ادخال كلمة المرور ';
                                }
                                return null;
                              },
                              obscureText: true,
                              decoration: InputDecoration(

                                border: OutlineInputBorder(),
                                prefix: Icon(Icons.password),
                                suffixIcon:Icon( Icons.remove_red_eye),
                                labelText: 'كلمة المرور',

                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Align(alignment: AlignmentDirectional.topStart,),
                              TextButton(onPressed: (){}, child: Text('هل نسيت كلمة المرور؟',style: TextStyle(color: Colors.indigo),),
                              ),
                            ],
                          ),
                          SizedBox(height: 30.0,),
                          Container(padding: EdgeInsets.only(left: 10.0,right: 10.0),
                            height: 45.0,
                            width: double.infinity,
                            child: OutlinedButton(

                                style:OutlinedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),backgroundColor: Colors.indigo),

                                child:  Text('تسجيل الدخول',style: TextStyle(color: Colors.white),),
                                onPressed:((){
                                  if(formkey.currentState!.validate()) {
                                    cupit.postLogIn(phone: phone.text,
                                        password: password.text);
                                  }


                            }) ),

                          ),
                          SizedBox(height: 30.0,),
                          TextButton(onPressed: (){}, child: Text('انشاء حساب ',style: TextStyle(color: Colors.indigo,fontSize: 18.0),),
                          ),

                        ],),
                      ),
                    ),



                  ),
                )),

              ],
            ),

          );
        },

      ),
    );


  }
}
