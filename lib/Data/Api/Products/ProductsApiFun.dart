import 'dart:async';
import 'dart:convert';
import 'package:flutter_app_test/modules/offers/offers.dart';
import 'package:http/http.dart' as http;

Future<List> getProductByBrandDataFB(name) async {
  http.Response response = await http.get(Uri.parse(
      "https://yodawy.herokuapp.com/products/?_sort=name:ASC&_where[0][brand.name]=$name"));
  List data = json.decode(response.body);
  return data;
}

Future<List> getProductBySubDataFB(id) async {
  http.Response response = await http.get(
      Uri.parse("https://yodawy.herokuapp.com/products/?sub_category=$id"));
  List data = json.decode(response.body);
  return data;
}

Future<List> getProductSerchDataFB(name) async {
  http.Response response = await http.get(Uri.parse(
      "https://yodawy.herokuapp.com/products/?_sort=name:ASC&_where[0][name_contains]=$name"));
  List data = json.decode(response.body);
  return data;
}

Future<List> getprouDataFB(id) async {
  List<dynamic> dataw = [];
  print('sasasdadas');
  await getAllProuDataFB().then((value) {
//    print(value[0]['sub_category']['category']);
    print('sasasdadas');
    for (int i = 0; i < value.length; i++) {
      if (value[i]['sub_category']['category'] == id) {
        dataw.add(value[i]);
        print(
            'sasasdadaتناتانتاتانتانتسايستشاينتشسايتشسايdjksahdjkashjkdhasjkhdjksahdjkahs');
      }
    }
    print(dataw);
  });

  return dataw;
}

Future<List> getProductByIDFB(id) async {
  http.Response response = await http
      .get(Uri.parse("https://yodawy.herokuapp.com/products/?_id=$id"));
  List data = json.decode(response.body);
  return data;
}
