import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

List<dynamic> MyOrdes = [];

void saveMyOrdesData() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String> MyOrdesData = MyOrdes.map((e) => json.encode(e)).toList();
  prefs.setStringList("MyOrdesData", MyOrdesData);
}
