import 'package:crypto_final_project/config/page.config.dart';
import 'package:crypto_final_project/config/route.config.dart';
import 'package:crypto_final_project/controllers/main.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {

  
  await GetStorage.init();

  final box = GetStorage();


  box.remove('email');

  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  
   MainApp({super.key});
  
    MainController mainController = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
       title: "Crypto Wallet",
       theme: ThemeData(
        scaffoldBackgroundColor: ThemeData.dark().primaryColor,
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF1B232A),
          foregroundColor: Colors.white,
          centerTitle: false,
          elevation: 0,
          surfaceTintColor: Colors.transparent,
        ),
        textTheme: TextTheme(
          bodyMedium: TextStyle(
            color: Colors.white,
          )
        ),
        useMaterial3: true,
      ),
    getPages: PageConfig.pages,
    initialRoute: RouteConfig.login,
    defaultTransition: Transition.leftToRight,
    );
  }
}
