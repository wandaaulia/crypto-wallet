


import 'package:crypto_final_project/controllers/coin/coin.controller.dart';
import 'package:get/get.dart';

class CoinBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut<CoinController>(() => CoinController(), fenix: true);
  }
}