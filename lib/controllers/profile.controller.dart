

import 'package:get/get.dart';

import 'package:get_storage/get_storage.dart';


class ProfileController extends GetxController {

 final box = GetStorage();

 var email = "";

 var password = "";

 @override
  void onInit() {
 
    var ini = box.read('auth');

    email = ini["email"];

    password = ini["password"];
  }
  


}


