



import 'dart:convert';

import 'package:crypto_final_project/config/api.config.dart';
import 'package:crypto_final_project/customLib/DetailCoin.dart';
import 'package:crypto_final_project/models/coin.model.dart';
import 'package:crypto_final_project/models/coins.model.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class CoinService {
  static Future all() async {

    var arrData = [];

    final res = await ApiInstance().getData("api/v3/coins/markets?vs_currency=idr&order=market_cap_desc&per_page=10&page=1&sparkline=false").catchError((err) {});

    if (res.body != null) {
      List<dynamic> jsonList = res.body;

      // Convert the dynamic list to a List<CoinsModel>
      List<CoinsModel> data = jsonList.map((json) => CoinsModel.fromJson(json)).toList();

      // Print the JSON representation of each CoinsModel
      for (var coinsModel in data) {
        arrData.add(coinsModel.toJson());
      }

      return arrData;
    }
    return null;
  }


  static Future<dynamic> getCoin(String id) async {

     final dataCoin;

      final dataDetailCoin;

    
  try {
      final response = await ApiInstance().getData("api/v3/coins/${id}");
      
      if (response.statusCode == 200) {
      

      final DataCoin = {
        "id" : response.body["id"],
        "name" : response.body["name"],
        "symbol" : response.body["symbol"],
        "imgLarge": response.body["image"]["large"],
        "market_cap_rank": response.body["market_cap_rank"],
        "current_price": response.body["market_data"]["current_price"]["idr"],
        "price_change_percentage_24h": response.body["market_data"]["price_change_percentage_24h"],
        "total_suply": response.body["market_data"]["total_supply"],
        "max_suply": response.body["market_data"]["max_supply"],
      };


        return DataCoin;

       

      } 
    } catch (e) {
      print('Error in API request: $e');
      throw e;
    }


  }}