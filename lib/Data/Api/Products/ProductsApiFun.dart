import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List> getProductByBrandDataFB(name) async {
  http.Response response = await http.get(Uri.parse(
      "https://yodawy.herokuapp.com/products/?_sort=name:ASC&_where[0][brand.name]=$name"));
  List data = json.decode(response.body);
  return data;
}

Future<List> getProductBySubDataFB(name) async {
  http.Response response = await http.get(Uri.parse(
      "https://yodawy.herokuapp.com/products/?_sort=name:ASC&_where[0][sub_category.name]=$name"));
  List data = json.decode(response.body);
  return data;
}

Future<List> getProductSerchDataFB(name) async {
  http.Response response = await http.get(Uri.parse(
      "https://yodawy.herokuapp.com/products/?_sort=name:ASC&_where[0][name_contains]=$name"));
  List data = json.decode(response.body);
  return data;
}
