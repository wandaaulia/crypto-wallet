import 'package:crypto_final_project/controllers/main.controller.dart';
import 'package:crypto_final_project/controllers/profile.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Profile extends StatelessWidget {
   Profile({super.key});


   MainController mainController = Get.find();

   ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Profile"),
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  child: Icon(Icons.person, color: Colors.white, size: 40),
                  margin: EdgeInsets.only(left: 20, right: 20, top: 40),
                  width: double.infinity),
              Container(
                width: 300,
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 60),
                child: Text("${mainController.inputEmail}"),
              ),
              Container(
                color: Colors.white,
                height: 1,
                margin: EdgeInsets.only(top: 8, bottom: 10),
                width: 300,
              ),
              Container(
                width: 300,
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 30),
                child: Text("${mainController.inputPassword}"),
              ),
              Container(
                color: Colors.white,
                height: 1,
                margin: EdgeInsets.only(top: 8, bottom: 10),
                width: 300,
              ),
              Container(
                width: 200,
                margin: EdgeInsets.only(top: 40),
                child: ElevatedButton(
                onPressed: () { Get.offAllNamed("/login");},
                child: Text(
                  "Logout",
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
                  backgroundColor: Colors.redAccent,
                  padding: EdgeInsets.all(0),
                ),
              ))
            ],
          ),
        ));
  }
}
