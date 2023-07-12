class LoginModel{
bool? status;
DataModel? data;

LoginModel.formjson(Map<String,dynamic>json){
  status =json['status'];
  data = DataModel.formjson(json['data']);

}
}
class DataModel{
  String? refresh;
  String? access;
  String? group;


  DataModel.formjson(Map<String,dynamic>json){

    refresh = json['refresh'];
    access = json['access'];
    group = json['group'];
  }

  }