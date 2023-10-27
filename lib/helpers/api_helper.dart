import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import '../app/model/currency.dart';

class APIHelper {
  APIHelper._();

  static final APIHelper apiHelper = APIHelper._();
  static List<Currency> list = [];

  Future<List<Currency>?> fetchWeatherData() async {
    String apiKey = "TetTDAvF0k3S8Re90eKFQDTIAHBjOb0xgxH5QNdt";
    String api = "https://api.currencyapi.com/v3/latest?apikey$apiKey";

    http.Response res = await http.get(Uri.parse(api));

    if (res.statusCode == 200) {
      Map decodedData = jsonDecode(res.body);
      
      (decodedData['data'] as Map).forEach((key, value) {
        Currency currency = Currency.fromMap(data: value);
        list.add(currency);
      });

      return list;
    }
    return null;
  }
}
