import 'dart:convert';

import 'package:flutter_app_test/models/product_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<dynamic> Cart = [];

void saveData() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String> CartData = Cart.map((e) => json.encode(e)).toList();
  prefs.setStringList("CartData", CartData);
}
