import 'package:crypto_final_project/controllers/main.controller.dart';
import 'package:crypto_final_project/services/coins.service.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class CoinController extends GetxController {

  MainController mainController = Get.find();


  var loadingData = false.obs;
  var coins = {}.obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  fetchData() async {
    loadingData(true);

    var res = await CoinService.getCoin(Get.arguments["id"]);

    print("ress 1");
    print(res);
    if (res != null) {
      if (kDebugMode) {
        print("api json");

        print(coins);
      }
      coins.assignAll(res);
      loadingData(false);
    }
  }

   buyCoins() {
      mainController.buyCoinCrypto(coins);
   }

}
