import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List> getbrandDataFB() async {
  http.Response response =
      await http.get(Uri.parse("https://yodawy.herokuapp.com/brands"));
  List data = json.decode(response.body);
  return data;
}
