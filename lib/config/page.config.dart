


import 'package:crypto_final_project/config/route.config.dart';
import 'package:crypto_final_project/controllers/coin/coin.binding.dart';
import 'package:crypto_final_project/views/coin.dart';
import 'package:crypto_final_project/views/login.dart';
import 'package:get/get.dart';

class PageConfig {
    static final List<GetPage> pages = [
      GetPage(name: RouteConfig.login, page: () => Login()),
      GetPage(name: RouteConfig.coin, page: () => Coin(), binding: CoinBinding()),
    
  ];
}