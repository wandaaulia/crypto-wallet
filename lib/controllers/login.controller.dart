import 'package:crypto_final_project/views/components/mainWrapper.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:get_storage/get_storage.dart';


class LoginController extends GetxController {
  var inputEmail = "";

  var inputPassword = "";

  var warningText = "".obs;

  final box = GetStorage();  

  @override
  void onInit() {}

  loginBtn() async {


      if(inputEmail != "" && inputPassword != "") {
      final myMap = {'email': inputEmail, 'password': inputPassword};

      box.write('auth', myMap);

      Get.to(() => MainWrapper());

       warningText.value = "";

      } else {
        warningText.value = "Email dan Password harus diisi";
      }

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
