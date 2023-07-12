import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store/login_screen/login_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

    body:  Stack(
      alignment: Alignment.center,
      children: [
        Column(
          children: [
            Expanded(child: Container(

              decoration: BoxDecoration(
                color: Colors.indigo,
                image: DecorationImage(image:AssetImage('images/on_poarding.png')),

                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50.0),bottomRight: Radius.circular(50.0)),
              ),

            )),
            Expanded(child: Container(
            )),
          ],
        ),
        Container(
          height: 400.0,
          width: 300.0,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20)),

          ),
 
            child: Column(children: [
              const Text('اختر الطريقة التي ترغب من خلالها المتابعة',
                style: TextStyle(fontSize:25.0 ,
                    fontWeight:FontWeight.w300),
                textAlign:TextAlign.center,
              ),
              const SizedBox(height: 17.0),

            Container(padding: EdgeInsets.only(left: 10.0,right: 10.0),
              height: 45.0,
              width: double.infinity,
              child: OutlinedButton(

                  style:OutlinedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),backgroundColor: Colors.indigo),

                  child:  Text('تسجيل الدخول'), onPressed:((){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>LogInScreen()));

              }) ),

            ),
              SizedBox(height: 30.0,),

              Container(
                height: 45.0,
                padding: EdgeInsets.only(left: 10.0,right: 10.0),
                width: double.infinity,
                child: OutlinedButton(
                    style:OutlinedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0,)),backgroundColor: Colors.white),

                    child:  Text('انشاء حساب',style: TextStyle(color: Colors.indigo),), onPressed:((){}) ),

              ),
              SizedBox(height: 35.0,),
              Text('او',style: TextStyle(color: Colors.indigo,fontWeight: FontWeight.bold,),textAlign: TextAlign.center,),
              SizedBox(height: 50.0,),
              Container(
                height: 45.0,
                padding: EdgeInsets.only(left: 10.0,right: 10.0),
                width: double.infinity,
                child: OutlinedButton(

                    style:OutlinedButton.styleFrom(shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                        backgroundColor: Colors.white,
                    ),

                    child:  Text('الدخول كزائر ',style: TextStyle(color: Colors.indigo),), onPressed:((){}) ),

              ),


            ],),
          ),
    
      ],
    ),

    );
  }
}
