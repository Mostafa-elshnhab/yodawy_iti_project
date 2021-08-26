import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List> getSubCategorybrandDataFB(id) async {
  http.Response response = await http
      .get(Uri.parse("https://yodawy.herokuapp.com/brands?categories=$id"));
  List data = json.decode(response.body);
  return data;
}

Future<List> getSubCategoryoffersDataFB(id) async {
  http.Response response = await http
      .get(Uri.parse("https://yodawy.herokuapp.com/offers/?categories=$id"));
  List data = json.decode(response.body);
  return data;
}
