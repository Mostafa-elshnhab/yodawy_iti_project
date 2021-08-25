import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List> getCategoryDataFB() async {
  http.Response response =
      await http.get(Uri.parse("https://yodawy.herokuapp.com/categories"));
  List data = json.decode(response.body);
  return data;
}
