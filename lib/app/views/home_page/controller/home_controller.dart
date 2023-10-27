
import 'package:dio/dio.dart';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class CurrencyConverterController {
  final Dio _dio = Dio();

  String _fromCurrency = '';
  String _toCurrency = '';
  List<String> _currencies = [];
  String _result = '';
  String _amount = '';

   final List<String> buttons = [
    '7',
    '8',
    '9',
    'C',
    '4',
    '5',
    '6',
    'DEL',
    '1',
    '2',
    '3',
    '✔️',
    '.',
    '0',
    ',',
    '',
  ];


  Future<String?> fetchLastUpdatedAt() async {
    String apiKey = "TetTDAvF0k3S8Re90eKFQDTIAHBjOb0xgxH5QNdt";
    String api = "https://api.currencyapi.com/v3/latest?apikey=$apiKey";

    http.Response res = await http.get(Uri.parse(api));

    if (res.statusCode == 200) {
      Map decodedData = jsonDecode(res.body);

      if (decodedData.containsKey('meta')) {
        Map meta = decodedData['meta'];
        if (meta.containsKey('last_updated_at')) {
          String lastUpdatedAt = meta['last_updated_at'];
          DateFormat dateFormat = DateFormat('dd MMM yyyy');
          String formattedLastUpdatedDate =
              dateFormat.format(DateTime.parse(lastUpdatedAt));
          return formattedLastUpdatedDate;
        }
      }
    }
    return null;
  }

  Future<void> fetchCurrencies() async {
    try {
      final response = await _dio.get('https://openexchangerates.org/api/currencies.json');
      final data = response.data;
      _currencies = data.keys.toList();
      _fromCurrency = _currencies[0];
      _toCurrency = _currencies[1];
    } catch (error) {
      // Handle error here
    }
  }

  Future<void> convertCurrency() async {
    try {
      final response = await _dio.get('https://api.exchangerate-api.com/v4/latest/$_fromCurrency');
      final data = response.data;
      final rate = data['rates'][_toCurrency];
      final amount = double.parse(_amount);
      final result = amount * rate;

      // Format result with three decimal places and commas for thousands separator
      _result = result.toStringAsFixed(3).replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
        (Match m) => '${m[1]},',
      );
    } catch (error) {
      print(error);
    }
  }

  // Add getters for the variables you want to access from the widget
  List<String> get currencies => _currencies;
  String get fromCurrency => _fromCurrency;
  String get toCurrency => _toCurrency;
  String get result => _result;
  String get amount => _amount;


  set fromCurrency(String value) {
    _fromCurrency = value;
  }
  
  set toCurrency(String value) {
    _toCurrency = value;
  }
  
  set amount(String value) {
    _amount = value;
  }
  
  set result(String value) {
    _result = value;
  }
}
