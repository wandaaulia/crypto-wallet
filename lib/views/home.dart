import 'package:crypto_final_project/config/route.config.dart';
import 'package:crypto_final_project/controllers/home.controller.dart';
import 'package:crypto_final_project/customLib/CurrencyFormat.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Home"), 
         automaticallyImplyLeading: false,),
        body: Container(
          color: Color(0xFF1B232A),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Obx(() {
                if (controller.loadingData.value) {
                  return Text("Loading ... ");
                }
                return Expanded(
                    child: ListView.builder(
                        itemCount: controller.coins.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          print(controller.coins[index]["id"]);
                          var rp = CurrencyFormat.convertToIdr(controller.coins[index]["current_price"], 2);
                          return ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              padding: EdgeInsets.all(0)),
                            onPressed: () { Get.toNamed(RouteConfig.coin, arguments: {"id" : "${controller.coins[index]["id"]}"});},
                            child: Card(
                            child: Container(
                              width: 388,
                              padding: EdgeInsets.all(10),
                              color: const Color(0xFF1B232A),
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
                                            image: NetworkImage(controller
                                                .coins[index]["image"]),
                                            width: 40,
                                            height: 40),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 20),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              controller.coins[index]["name"],
                                              style: TextStyle(
                                                color: Colors.white,
                                                letterSpacing: 0.37,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            Text(
                                              controller.coins[index]["symbol"],
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
                                      if (controller.coins[index]
                                              ["price_change_percentage_24h"] >
                                          0)
                                        Text(
                                            '${controller.coins[index]["price_change_percentage_24h"].toStringAsFixed(2)}',
                                            style: TextStyle(
                                              color: Color(0xFF5ED5A8),
                                              fontSize: 14,
                                              letterSpacing: 0.37,
                                              fontWeight: FontWeight.w400,
                                            ))
                                      else
                                        Text(
                                            '${controller.coins[index]["price_change_percentage_24h"].toStringAsFixed(2)}',
                                            style: TextStyle(
                                              color: Color(0xFFDD4A4A),
                                              fontSize: 14,
                                              letterSpacing: 0.37,
                                              fontWeight: FontWeight.w400,
                                            ))
                                    ]),
                                  )
                                ],
                              ),
                            ),
                          )
)      ;                   }));
              }),
            ],
          ),
        ));
  }
}
