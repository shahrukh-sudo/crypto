import 'dart:convert';


import 'package:http/http.dart' as http;

const List currenciesList = [
  'USD',
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

  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  var url = 'https://docs.coinapi.io/#output-data-format';
  int start =0 ;

var se = cryptoList[1];


  Future bitCoinData  (String conversion)async{
    Map<int,String> cryptoPrices = {};
    for(int i = 0;i<cryptoList.length; i++){
      String base = cryptoList[i].toString();
      Uri uri = Uri.https('rest.coinapi.io', '/v1/exchangerate/$base/$conversion',{
        'apikey':'391FCE28-518D-41F8-941E-BB61BF15FE61'
      } );
      http.Response response = await http.get(uri);

      var decodedData = jsonDecode(response.body);
       cryptoPrices[i]= decodedData['rate'].toString();
    }

    return cryptoPrices;

  }

}
// Uri uri = Uri.https('samples.openweathermap.org', '/data/2.5/weather', {
//   'lat': '39',
//   'lon': '139',
//   'appid': 'b6907d289e10d714a6e88b30761fae22'
// });
// http.Response response = await http.get(uri);