import 'package:crypto_final_project/controllers/main.controller.dart';
import 'package:crypto_final_project/customLib/CurrencyFormat.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Wallet extends StatelessWidget {
  Wallet({super.key});

  MainController mainController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Wallet"),
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(child: Obx(() {
          if (mainController.myCoins.length > 0) {
            return ListView.builder(
                itemCount: mainController.myCoins.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  print(mainController.myCoins[index]["id"]);
                  var rp = CurrencyFormat.convertToIdr(
                      mainController.myCoins[index]["current_price"], 2);
                  return Card(
                    color: Colors.transparent,
                    child: Container(
                      margin: EdgeInsets.only(top: 20),
                      width: 388,
                      padding: EdgeInsets.all(10),
                      color: Colors.transparent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(1),
                                width: 40,
                                child: Image(
                                    image: NetworkImage(mainController
                                        .myCoins[index]["imgLarge"]),
                                    width: 40,
                                    height: 40),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      mainController.myCoins[index]["name"],
                                      style: TextStyle(
                                        color: Colors.white,
                                        letterSpacing: 0.37,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Text(
                                      mainController.myCoins[index]["symbol"],
                                      style: TextStyle(
                                        color: Color(0xFF777777),
                                        fontSize: 14,
                                        letterSpacing: 0.37,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Container(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    '${rp}',
                                    style: TextStyle(
                                      color: Colors.white,
                                      letterSpacing: 0.37,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ]),
                          )
                        ],
                      ),
                    ),
                  );
                });
          }

          return Container(
            child: Text("Tidak ada crypto yang dibeli"),
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 100, left: 20, right: 20),
          );
        })));
  }
}
