import 'package:crypto_final_project/controllers/login.controller.dart';
import 'package:crypto_final_project/controllers/main.controller.dart';
import 'package:crypto_final_project/views/components/mainWrapper.dart';
import 'package:crypto_final_project/views/home.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:get/get.dart';



class Login extends StatelessWidget {
   Login({super.key});

   LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("")),
        body: SingleChildScrollView(
            child: Container(
              color: Color(0xFF1B232A),
              padding: EdgeInsets.only(top: 80, left: 20, right: 20),
              child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
              Text(
                "Sign in",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontFamily: 'Neue Montreal',
                  fontWeight: FontWeight.w700,
                  height: 0.04,
                  letterSpacing: 0.84,
                ),
              ),
              SizedBox(height: 60, width: 10),
              Text("Email", style: TextStyle(color: Colors.grey)),
              SizedBox(height: 10, width: 10),
              TextField(
                onChanged: (value) {
                     loginController.inputEmail = value.toString();
                },
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Enter your email",
                  hintStyle: TextStyle(color: Colors.white),
                  fillColor: Colors.black,
                  filled: true,
                  border: InputBorder.none
                ),
              ), SizedBox(height: 30, width: 10),
              Text("Password", style: TextStyle(color: Colors.grey)),
              SizedBox(height: 10, width: 10),
              TextField(
                 onChanged: (value) {
                    loginController.inputPassword = value.toString();
                },
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Enter your password",
                  hintStyle: TextStyle(color: Colors.white),
                  fillColor: Colors.black,
                  filled: true,
                  border: InputBorder.none,
                  suffixIcon: Icon(Icons.password, color: Colors.grey)
                ),
              ),
              Obx(() {
              return Container(margin: EdgeInsets.only(top: 20) ,child: Text("${loginController.warningText.value}", style: TextStyle(color: Colors.red, fontSize: 14),));
              }),
              Container(
                margin: EdgeInsets.only(top: 30),
                child: ElevatedButton(onPressed: () { loginController.loginBtn(); }, child: Text("Sign in", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700,
),), 
                style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16),), backgroundColor: Color(0xFF5ED5A8), fixedSize: Size(366,54),)),
              )
                      ],
                    ),
            )));
  }
}
