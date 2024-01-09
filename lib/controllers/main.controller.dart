import 'package:crypto_final_project/config/route.config.dart';
import 'package:crypto_final_project/customLib/DetailCoin.dart';
import 'package:crypto_final_project/models/coins.model.dart';
import 'package:crypto_final_project/services/coins.service.dart';
import 'package:crypto_final_project/views/home.dart';
import 'package:crypto_final_project/views/profile.dart';
import 'package:crypto_final_project/views/wallet.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MainController extends GetxController {
  List myCoins = [].obs;

  var inputEmail = "";
  var inputPassword = "";

  @override
  void onInit() async {

      // await GetStorage.init();
  }

  buyCoinCrypto(id) {
    myCoins.add(id);
  }

  var currentIndex = 0.obs;

  final pages = <String>['/home', '/wallet', '/profile'];
  

  void changePage(int index) {
    print("ini");
    print(index);
    currentIndex.value = index;
    Get.toNamed(pages[index], id: 1);
  }

  Route? onGenerateRoute(RouteSettings settings) {
    print(settings);

    if (settings.name == '/home')
      return GetPageRoute(
        settings: settings,
        page: () => Home(),
      );

    if (settings.name == '/wallet')
      return GetPageRoute(
        settings: settings,
        page: () => Wallet(),
      );

    if (settings.name == '/profile')
      return GetPageRoute(
        settings: settings,
        page: () => Profile(),
      );

    return null;
  }
}
