import 'package:flutter/material.dart';
import 'package:flutter_bitcoin/coin_data.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'USD';
  List <DropdownMenuItem> dropdownitems = [];
 void  getDropDownMenuItem(){


    for(int i= 0; i<currenciesList.length; i++){
      String currency = currenciesList[i];
     var item =  DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropdownitems.add(item);


    }

  }
  Map<int, String> coinValues = {};
  var man;
  Future<Map> getData(String dat)async{
    coinValues = await CoinData().bitCoinData( dat);
    return coinValues;


  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDropDownMenuItem();

  }

  @override
  Widget build(BuildContext context) {


      return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          NewWidget(man: coinValues[0], selectedCurrency: selectedCurrency,base: cryptoList[0]),
          NewWidget(man: coinValues[1], selectedCurrency: selectedCurrency,base: cryptoList[1]),
          NewWidget(man: coinValues[2], selectedCurrency: selectedCurrency,base: cryptoList[2]),

          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: DropdownButton(
                value: selectedCurrency,

              items:dropdownitems,
              onChanged: (value)async{
                  var yy = await getData(value);
                  setState(() {
                    selectedCurrency = value;


                  });
              }



            )
          ),
        ],
      ),
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    Key key,
    @required this.man,
    @required this.selectedCurrency,
    @required this.base,
  }) : super(key: key);

  final String man;
  final String selectedCurrency;
  final String base;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            '1 $base = $man $selectedCurrency',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
