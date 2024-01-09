import 'package:crypto_final_project/controllers/coin/coin.controller.dart';
import 'package:crypto_final_project/controllers/main.controller.dart';
import 'package:crypto_final_project/customLib/CurrencyFormat.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Coin extends StatelessWidget {
  Coin({super.key});

  final controller = Get.put(CoinController());

  @override
  Widget build(BuildContext context) {
    print("context");
    print(controller.coins);

    return Scaffold(
        appBar: AppBar(title: Text("Coin")),
        body: Obx(() {
          if (controller.loadingData.value) {
            return Text("loading ...");
          } else {
            return Container(
                padding: EdgeInsets.only(top: 30, left: 20, right: 20),
                child: Column(
                  children: [
                    Row(children: [
                      Image(
                        image: NetworkImage(
                          '${controller.coins["imgLarge"]}',
                        ),
                        width: 28,
                        height: 28,
                      ),
                      Container(
                        child: Text(
                          controller.coins["name"],
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w700),
                        ),
                        margin: EdgeInsets.only(left: 8),
                      ),
                      Container(
                        child: Text(
                          "${controller.coins["symbol"]}".toUpperCase() +
                              " Price",
                          style: TextStyle(
                              fontSize: 16,
                              color: Color(0xff64748b),
                              fontWeight: FontWeight.w400),
                        ),
                        margin: EdgeInsets.only(left: 8),
                      ),
                    ]),
                    Container(
                      margin: EdgeInsets.only(top: 12),
                      child: Row(
                        children: [
                          Obx(() {
                            var rp = CurrencyFormat.convertToIdr(
                                controller.coins["current_price"], 2);

                            return Text(
                              rp,
                              style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            );
                          }),
                          Container(
                            margin: EdgeInsets.only(left: 6, right: 6),
                            child: Obx(() {
                              if (controller
                                      .coins["price_change_percentage_24h"] >
                                  0)
                                return Text(
                                    '${controller.coins["price_change_percentage_24h"].toStringAsFixed(2)}' +
                                        '%',
                                    style: TextStyle(
                                      color: Color(0xFF5ED5A8),
                                      fontSize: 16,
                                      letterSpacing: 0.37,
                                      fontWeight: FontWeight.w700,
                                    ));
                              else
                                return Text(
                                    '${controller.coins["price_change_percentage_24h"].toStringAsFixed(2)}' +
                                        '%',
                                    style: TextStyle(
                                      color: Color(0xFFDD4A4A),
                                      fontSize: 14,
                                      letterSpacing: 0.37,
                                      fontWeight: FontWeight.w700,
                                    ));
                            }),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: 380,
                      margin: EdgeInsets.only(top: 30, left: 0, right: 0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Market Cap Rank"),
                              Text("${controller.coins["market_cap_rank"]}")
                            ],
                          ),
                          Container(
                            color: Colors.white,
                            height: 1,
                            margin: EdgeInsets.only(top: 10, bottom: 10),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Total Supply"),
                              Text("${controller.coins["total_suply"]}")
                            ],
                          ),
                          Container(
                            color: Colors.white,
                            height: 1,
                            margin: EdgeInsets.only(top: 10, bottom: 10),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Max Supply"),
                              Text("${controller.coins["max_suply"]}")
                            ],
                          ),
                          Container(
                            color: Colors.white,
                            height: 1,
                            margin: EdgeInsets.only(top: 10, bottom: 10),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 90,
                          margin: EdgeInsets.only(top: 20),
                          child: ElevatedButton(
                            onPressed: () { controller.buyCoins();},
                            child: Text(
                              "Buy",
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              backgroundColor: Color.fromARGB(255, 40, 131, 96),
                              padding: EdgeInsets.all(0),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ));
          }
        }));
  }
}
