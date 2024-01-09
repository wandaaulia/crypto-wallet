

import 'package:get/get.dart';

import 'package:get_storage/get_storage.dart';


class ProfileController extends GetxController {

 final box = GetStorage();

 @override
  void onInit() {
 
    var ini = box.read('quote');
    print("local storage");

    print(ini);
  }
  


}


