import 'package:hive/hive.dart';

class HiveDB{
  static String nameBase = "pdp";
  static var box= Hive.box(nameBase);

  static putUser({id}){
    box.put("user", id);
  }

 static getUser(){
    return box.get("user");
  }

 static deleteUser(){
    box.delete("user");
  }
}