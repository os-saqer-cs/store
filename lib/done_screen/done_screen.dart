import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DoneScreen extends StatelessWidget {
  const DoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(children: [
      Expanded(
        child: Column(
          children: [
            Expanded(child: Container()),
            Expanded(child: Container(child: Image(image:AssetImage('images/on_poarding.png')))),


          ],
        ),
        
      ),
      SizedBox(height: 30.0,),
      Expanded(child: Container(

          child:  Column(children: [
            Text('تم تسجيل الدخول',style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold,color: Colors.indigo),textAlign: TextAlign.center,) ,
            SizedBox(height: 30.0,),
     Container(width: double.infinity,padding: EdgeInsets.all(40.0),
       //height: 100.0,
       child: OutlinedButton(

            style:OutlinedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),backgroundColor: Colors.indigo),

              child:  Text(' المتابعة',style: TextStyle(color: Colors.white),),
             onPressed:((){}),




       ),
     )],),

      )),
    ],),

    );
  }
}
