import 'package:flutter/material.dart';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

List<DropdownMenuItem<String>> KdropdownItems = [];

class CoinData {
  static void setItems() {
    for (String i in cryptoList) {
      KdropdownItems.add(
        DropdownMenuItem(
          value: i,
          child: Text(i),
        ),
      );
    }
  }
}
