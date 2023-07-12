import 'package:dio/dio.dart';

class DioHelper {
 static late  Dio dio;

 static init(){
   dio = Dio(BaseOptions(
     baseUrl: 'https://musaid-app-fo92s.ondigitalocean.app/',
     receiveDataWhenStatusError: true

   ));


 }
 static Future<Response>? PostData(
 {required String url,
   Map<String,dynamic>?data,
   Map<String,dynamic>?query,
 }
     ) async{


   return await dio.post(url,queryParameters: query,data:data);

 }
}