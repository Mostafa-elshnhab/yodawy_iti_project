import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

List<dynamic> Fav = [];

void saveFavtData() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String> FavData = Fav.map((e) => json.encode(e)).toList();
  prefs.setStringList("favData", FavData);
}
