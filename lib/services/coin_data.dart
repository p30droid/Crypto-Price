import 'package:http/http.dart' as http;
import 'dart:convert';

const List<String> currenciesList = [
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'JPY',
  'RUB',
  'USD',
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
  'TRX',
  'MANA',
  'ADA',
  'BNB',
  'DOGE',
  'BCH'
];

//todo: Enter your API key front of 'apiKey'
const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = 'Put your api key here';

class CoinData { //Getting data from API and return
  Future getCoinData(String selectedCurrency) async {
    Map<String, String> cryptoPrices = {};
    for (String crypto in cryptoList) {
      http.Response response = await http.get(
          Uri.parse('$coinAPIURL/$crypto/$selectedCurrency?apikey=$apiKey'));
      if (response.statusCode == 200) {
        dynamic body = jsonDecode(response.body);
        var lastPrice = body['rate'] as double;
        cryptoPrices[crypto] = lastPrice.toStringAsFixed(2);
        print(cryptoPrices);
      } else {
        print('Error : ${response.statusCode}');
      }
    }
    return cryptoPrices;
  }
}
