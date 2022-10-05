import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'model.dart';

class FetchDoaList {
  var data = [];
  List<KumpulanDoa> results = [];
  String urlList = 'https://doa-doa-api-ahmadramadhan.fly.dev/api';

  Future<List<KumpulanDoa>> getKumpulanDoa({String? query}) async {
    var url = Uri.parse(urlList);
    try {
      var response = await http.get(url, headers: {
        "Accept": "application/json",
        "Access-Control_Allow_Origin": "*",
        "Content-type": "application/json",
        "Access-Control_Allow_Methods": "GET, DELETE, HEAD, OPTIONS"
      });
      if (response.statusCode == 200) {
        data = json.decode(response.body);
        results = data.map((e) => KumpulanDoa.fromJson(e)).toList();
        if (query != null) {
          results = results
              .where((element) =>
                  element.doa!.toLowerCase().contains((query.toLowerCase())))
              .toList();
        }
      } else {
        if (kDebugMode) {
          print("fetch error");
        }
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print('error: $e');
      }
    }
    return results;
  }
}
