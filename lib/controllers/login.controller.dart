import 'package:crypto_final_project/views/components/mainWrapper.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:get_storage/get_storage.dart';


class LoginController extends GetxController {
  var inputEmail = "";

  var inputPassword = "";

  final box = GetStorage();  

  @override
  void onInit() {}

  loginBtn() async {
    Get.to(() => MainWrapper());

    try {
      print("input email dan password");
      print(inputEmail);
      print(inputPassword);
      
      box.write('email', '${inputEmail}');


      Get.to(() => MainWrapper());
    } catch (e) {}
  }

  Future<void> saveDataToLocalStorage(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  Future<String?> getDataFromLocalStorage(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }
}
