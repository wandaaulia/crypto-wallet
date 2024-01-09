import 'package:crypto_final_project/config/environment.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import "dart:async";


class ApiInstance extends GetConnect {
  
// Future<Response> getData(String path) {
//   debugPrint(path);
//   return get("https://api.coingecko.com${path})")
//   .catchError((err) {
//     if(kDebugMode) {
//       print("Api Instance Error on getData : $err");
//     }
//     return const Response(body: null, statusCode: 500);
//   });
  
// }

// Future<Response> getDataSingleData(String path) async {
//   debugPrint(path);
//   return await get("https://api.coingecko.com${path})")
//   .catchError((err) {
//     if(kDebugMode) {
//       print("Api Instance Error on getData : $err");
//     }
//     return const Response(body: null, statusCode: 500);
//   });
// }


 Future<Response> getData(String endpoint) async {
    try {
      final response = await get('https://api.coingecko.com/$endpoint');
      return response;
    } catch (e) {
      print('Error in API request: $e');
      throw e;
    }
  }


}

