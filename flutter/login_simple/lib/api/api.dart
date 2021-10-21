import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:login_simple/api/login_respon.dart';

const baseUrl = "http://192.168.90.218/apiflutter/";

class Api {
  static Future<LoginRespon> cekLogin(String username, String password) async {
    var url = baseUrl + "login2.php";
    final response = await http.post(Uri.parse(url), headers: {
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*",
      "Access-Control-Allow-Credentials": "true",
      'Access-Control-Allow-Headers': 'X-Requested-With,content-type',
      "Access-Control-Allow-Methods": "GET, POST",
    }, body: {
      "username": username,
      "password": password
    });
    if (response.statusCode == 200) {
      return LoginRespon.fromJsonMap(jsonDecode(response.body));
    } else {
      throw "failed to connect server";
    }
  }
}
