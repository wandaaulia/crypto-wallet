

import 'package:crypto_final_project/controllers/main.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class MainWrapper extends StatelessWidget {

  MainController mainController = Get.find();

  MainWrapper({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
        key: Get.nestedKey(1),
        initialRoute: '/home',
        onGenerateRoute: mainController.onGenerateRoute,
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.black),
              label: '',
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.wallet, color: Colors.black),
              label: '',
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Colors.black),
              label: '',
            ),
           
          ],
          currentIndex: mainController.currentIndex.value,
          selectedItemColor: Colors.pink,
          onTap: mainController.changePage,
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }


}