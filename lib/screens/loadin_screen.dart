import 'package:crypto_price/screens/price_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../services/coin_data.dart';
import '../utilities/const_properties.dart';

class LoadingScreen extends StatefulWidget {
  LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  void getData() async {
    dynamic DataAPI = await CoinData().getCoinData(selectedCurrency = 'USD');
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return PriceScreen(
        dataAPI: DataAPI,
      );
    }));
  }

  @override
  void initState() {
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          SpinKitDancingSquare(
            color: Colors.lightBlueAccent,
            size: 100,
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            'Feching Data, Please be patient.',
            style: TextStyle(color: Colors.black),
          )
        ],
      )),
    );
  }
}
