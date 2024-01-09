

import 'package:crypto_final_project/models/coins.model.dart';
import 'package:crypto_final_project/services/coins.service.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {

  var loadingData = false.obs;
  var coins = [];



  @override
  void onInit() {
    fetchData();
  }

  fetchData() async {
    loadingData(true);

    var res = await CoinService.all();
    if(res != null) {
      if (kDebugMode) {
        print("api json");
        coins = res;

         print(coins[1]);
      }
      loadingData(false);

    }

    // // Print the JSON representation of each CoinsModel
    //   for (var coinsModel in res) {
    //     print(coinsModel.toJson());
    //   }

  }
}