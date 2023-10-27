import 'dart:convert';

// import 'package:currency_converter/views/login_page/widget/text_field_auth.dart';
import 'package:currency_converter/helpers/themes.dart';
import 'package:currency_converter/app/views/home_page/controller/home_controller.dart';
import 'package:dio/dio.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'package:ionicons/ionicons.dart';

import '../widget/button.dart';

class HomePage extends StatefulWidget {
  final String email;
  final String name;
  final String phoneNumber;
  const HomePage(
      {Key? key,
      required this.email,
      required this.name,
      required this.phoneNumber})
      : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Dio _dio = Dio();
  final TextEditingController _controller = TextEditingController();
  String _fromCurrency = '';
  String _toCurrency = '';
  List<String> _currencies = [];
  String _result = '';
  var _amount = '';

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

  @override
  void initState() {
    super.initState();
    _fetchCurrencies();
  }

  void _fetchCurrencies() async {
    try {
      final response =
          await _dio.get('https://openexchangerates.org/api/currencies.json');
      final data = response.data;
      setState(() {
        _currencies = data.keys.toList();
        _fromCurrency = _currencies[0];
        _toCurrency = _currencies[1];
      });
    } catch (error) {
      // Handle error here
    }
  }

  void _convertCurrency() async {
    try {
      final response = await _dio
          .get('https://api.exchangerate-api.com/v4/latest/$_fromCurrency');
      final data = response.data;

      final rate = data['rates'][_toCurrency];
      final amount = double.parse(_amount);
      final result = amount * rate;
      final formattedResult = result.toStringAsFixed(3).replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]},',
    );

      setState(() {
        _result = '$formattedResult $_toCurrency';
      });
    } catch (error) {
      print(error);
    }
  }

  bool A = true;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    CurrencyConverterController controller = CurrencyConverterController();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Center(
            child: Padding(
              padding:  EdgeInsets.only(
                top: screenHeight * 0.0337,
              ),
              child: Text(
                'Currency Converter',
                style: pageHeaderTextStyle,
              ),
            ),
          ),
          FutureBuilder<String?>(
            future: controller.fetchLastUpdatedAt(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text("Loading...");
              } else if (snapshot.hasError) {
                return Text(
                  "Error: ${snapshot.error}",
                  style: onboardingSubHeaderTextStyle,
                );
              } else if (snapshot.hasData) {
                return Text("Last updated at: ${snapshot.data}");
              } else {
                return Text("Data not available");
              }
            },
          ),
          SizedBox(
            height: screenHeight * 0.0112,
          ),
          Padding(
            padding:  EdgeInsets.symmetric(vertical: screenHeight * 0.0157, horizontal: screenWidth * 0.034),
            child: Container(
              decoration: BoxDecoration(
                color: primaryTextColorWhite,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 5.0,
                    offset: Offset(0.0, 2.0),
                  ),
                ],
              ),
              height: screenHeight * 0.112,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: screenWidth * 0.0728),
                    child: SizedBox(
                      width: screenWidth * 0.2428,
                      child: DropdownButton<String>(
                        value: _fromCurrency,
                        items: _currencies.map((currency) {
                          return DropdownMenuItem(
                            alignment: Alignment.center,
                            value: currency,
                            child: Text(
                              currency,
                              style: dropdownTextStyle,
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _fromCurrency = value!;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    width: screenWidth * 0.0971,
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: screenWidth * 0.0291, vertical: screenHeight * 0.0135),
                    child: Row(
                      children: [
                        SizedBox(
                          width: screenWidth * 0.0728,
                        ),
                        Container(
                            height: screenHeight * 0.0448,
                            width: screenWidth * 0.364,
                            child: Column(
                              children: [
                                Text(
                                  _amount,
                                  style: amountTextStyle(fontSize: 24),
                                ),
                                Divider(
                                  color: primaryColor,
                                  height: 0.5,
                                )
                              ],
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: screenHeight * 0.0122,
          ),
          Container(
            height: screenHeight * 0.0562,
            width: screenWidth * 0.1214,
            decoration: BoxDecoration(
              color: primaryTextColorWhite,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                  offset: Offset(0.0, 2.0),
                ),
              ],
            ),
            child: GestureDetector(
              onTap: _convertCurrency,
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: screenWidth * 0.0194 , vertical: screenHeight * 0.00898),
                child: SvgPicture.asset(
                  'assets/transfer.svg',
                ),
              ),
            ),
          ),
          SizedBox(
            height: screenHeight * 0.0122,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: screenHeight * 0.0157, horizontal: screenWidth * 0.034),
            child: Card(
              child: Container(
                decoration: BoxDecoration(
                  color: primaryTextColorWhite,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5.0,
                      offset: Offset(0.0, 2.0),
                    ),
                  ],
                ),
                height: screenHeight * 0.112,
                child: Row(
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(left: screenWidth * 0.0728),
                      child: SizedBox(
                        width: screenWidth * 0.2428,
                        child: DropdownButton<String>(
                          value: _toCurrency,
                          items: _currencies.map((currency) {
                            return DropdownMenuItem(
                              value: currency,
                              child: Text(
                                '$currency',
                                style: dropdownTextStyle,
                              ),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _toCurrency = value!;
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      width: screenWidth * 0.0971,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.0291, vertical: screenHeight * 0.0135),
                      child: Row(
                        children: [
                          SizedBox(
                            width: screenWidth * 0.0728,
                          ),
                          Container(
                              margin: EdgeInsets.only(top: screenHeight * 0.0337),
                              height: screenHeight * 0.0449,
                              width: screenWidth * 0.364,
                              child: Column(
                                children: [
                                  (_amount.isNotEmpty)
                                      ? Text(
                                          _result,
                                          style: amountTextStyle(fontSize: 16),
                                        )
                                      : Text("Result"),
                                  Divider(
                                    color: primaryColor,
                                    height: 0.5,
                                  )
                                ],
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: screenHeight * 0.4158,
            margin: EdgeInsets.only(right: screenWidth * 0.0485, left: screenWidth * 0.0485, bottom: screenHeight * 0.0337),
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * .0194, vertical: screenHeight * 0.00898 ),
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.all(0),
                itemCount: buttons.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 4,
                ),
                itemBuilder: (BuildContext context, int index) {
                  if (index == 7) {
                    return Mybutton(
                      buttonTapped: () {
                        setState(() {
                          _amount = _amount.substring(0, _amount.length - 1);
                        });
                      },
                      buttonText: buttons[index],
                      color: primaryColor,
                      style: buttonStyle(color: primaryTextColorWhite),
                    );
                  } else if (index == 3) {
                    return Mybutton(
                      buttonTapped: () {
                        setState(() {
                          _amount = '';
                        });
                      },
                      buttonText: buttons[index],
                      color: primaryColor,
                      style: buttonStyle(color: primaryTextColorWhite),
                    );
                  } else if (index == 11) {
                    return Mybutton(
                      buttonTapped: () {
                        _convertCurrency();
                      },
                      buttonText: buttons[index],
                      color: primaryColor,
                      style: buttonStyle(color: primaryTextColorWhite),
                    );
                  }
                  return Mybutton(
                      buttonTapped: () {
                        if (_amount.length < 9) {
                          setState(() {
                            _amount = _amount + buttons[index];
                            _result = '';
                          });
                        }
                      },
                      buttonText: buttons[index],
                      color: primaryTextColorWhite,
                      style: amountTextStyle(fontSize: 24));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
