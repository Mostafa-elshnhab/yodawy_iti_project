import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List> getSubCategoryDataFB(id) async {
  http.Response response = await http.get(
      Uri.parse("https://yodawy.herokuapp.com/Sub-Categories?category=$id"));
  List data = json.decode(response.body);
  return data;
}
