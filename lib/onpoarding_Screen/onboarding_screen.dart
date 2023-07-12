import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:store/onpoarding_Screen/cupit/onBoardingcupit.dart';
import 'package:store/onpoarding_Screen/cupit/onboardingstatus.dart';
import 'package:store/start_screen/start_screen.dart';
class BoardingModel {
  final String image;


  BoardingModel({required this.image});
}
class OnBoardingScreen extends StatefulWidget {



  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {



    var controller = PageController();
    String buttonname = 'التالي';
    List<BoardingModel> model = [
      BoardingModel(

        image: 'images/on_poarding.png',),

      BoardingModel(

        image: 'images/on_poarding.png',),

      BoardingModel(

          image: 'images/on_poarding.png'),
      BoardingModel(

          image: 'images/on_poarding.png'),


    ];

    return BlocProvider(
      create:(context)=>OnBoardingCupit(),
      child: BlocConsumer<OnBoardingCupit,OnBoardingStatus>(
        listener: (context,state){},
        builder: (context,state){
          return  Scaffold(
            body: Container(

              width: double.infinity,
              height: double.infinity,
              child: Column(children: [
                Expanded(
                  child: PageView.builder(

                    controller:controller,
                    physics: BouncingScrollPhysics(),

                    itemBuilder: (context,index)=>buildboardingItem(model[index]),
                    itemCount: model.length,
                    onPageChanged:( (int index){
                      OnBoardingCupit.get(context).ChangeIndex(index);

                      if( OnBoardingCupit.get(context).index == model.length - 1){
                        OnBoardingCupit.get(context).Changebool();
                       }





                    }),),
                ),
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      decoration: BoxDecoration(color: Colors.grey,

                          borderRadius: BorderRadius.only(topLeft: Radius.circular(50.0),topRight: Radius.circular(50.0))
                      ),
                      height: 300.0,


                    ),
                    Container(
                      decoration: BoxDecoration(color: Colors.indigo[900],

                          borderRadius: BorderRadius.only(topLeft: Radius.circular(50.0),topRight: Radius.circular(50.0))
                      ),
                      height: 290.0,

                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Center(
                              child: SmoothPageIndicator(
                                controller: controller,
                                count: model.length,
                                effect:WormEffect(
                                  activeDotColor: Colors.yellow,
                                  dotColor: Colors.white,
                                  dotWidth: 20.0,
                                  dotHeight: 10.0,
                                  spacing:0,
                                  radius: 16.0,
                                  //type: WormType.thinUnderground,
                                ),
                              ),
                            ),

                            SizedBox(height: 20.0,),
                            Text(
                              'صمم هذه التطبيق لشرء كل ما يخص الأدوات من مختلف متاجر الاردن',
                              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 24.0,color: Colors.white),
                              textAlign: TextAlign.center,),
                            SizedBox(height: 20.0,),

                            Container(width:140.0
                                ,height: 50.0,
                                child: ElevatedButton(onPressed: (){
                                  setState(() {

                                  });
                                  if(OnBoardingCupit.get(context).isLast){

                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => StartScreen(),
                                        ),
                                            (route) => false);



                                  }else{
                                    controller.nextPage(
                                      duration: Duration(milliseconds: 750),
                                      curve: Curves.fastEaseInToSlowEaseOut,
                                    );}
                                },
                                  style:ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0,)),backgroundColor: Colors.white),

                                  child:
                                  Text( OnBoardingCupit.get(context).isLast ? 'ابدأ':'التالي',style:TextStyle(fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                      color: Colors.indigo[900]),
                                  ),
                                ))
                          ],
                        ),
                      ),
                    )
                  ],
                ),





              ],




              ),
            ),
          );
        },

      ),
    );
  }

  Widget buildboardingItem(BoardingModel model  ) => Padding(
    padding: const EdgeInsets.all(20.0),
    child: Column(

      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: Image(image: AssetImage('${model.image}'))),

      ],
    ),
  );

    }


