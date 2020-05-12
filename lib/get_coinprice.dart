import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class GetCoinPrice {
  var apiKey = "6a54e93f7ebbdeef023c5074110ce162";
  var currency;
  var coinPriceBTC;
  var coinPriceETH;
  var coinPriceXRP;
  List<dynamic> decodedData;
  GetCoinPrice({@required this.currency});
  Future<void> getCoinPrice() async {
    try {
      http.Response response = await http.get(
          "https://api.nomics.com/v1/currencies/ticker?key=$apiKey&ids=BTC,ETH,XRP&interval=1d&convert=$currency");
      String body = response.body;
      decodedData = jsonDecode(body);
      coinPriceBTC = decodedData[0]['price'];
      coinPriceETH = decodedData[1]['price'];
      coinPriceXRP = decodedData[2]['price'];
      print(coinPriceBTC);
    } catch (e) {
      print('unexpected $e');
    }
  }
}
