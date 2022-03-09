import 'package:crypto_price/screens/price_calc_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../services/coin_data.dart';
import 'dart:io' show Platform;
import 'dart:core';
import '../utilities/const_properties.dart';
import '../utilities/crypto_card.dart';

class PriceScreen extends StatefulWidget {
  const PriceScreen({Key? key, this.dataAPI}) : super(key: key);
  final dataAPI;

  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {

  DropdownButton<String> androidDropdown() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (String currency in currenciesList) {
      var newItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropdownItems.add(newItem);
    }

    return DropdownButton<String>(
      value: selectedCurrency,
      items: dropdownItems,
      onChanged: (value) {
        setState(() {
          selectedCurrency = value!;
          getData();
        });
      },
    );
  } //Android currency picker

  CupertinoPicker iOSPicker() {
    List<Text> pickerItems = [];
    for (String currency in currenciesList) {
      pickerItems.add(Text(currency));
    }

    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {
        selectedCurrency = currenciesList[selectedIndex];
        getData();
      },
      children: pickerItems,
    );
  } //IOS currency picker

  Map<String, String> coinValues = {};
  bool isWaiting = false;

  void getData() async {
    try {
      isWaiting = true;
      late var data;
      if(selectedCurrency == 'USD') {
        data = await widget.dataAPI;
      }else{
        data = await CoinData().getCoinData(selectedCurrency);
      }
      isWaiting = false;
      setState(() {
        coinValues = data;
      });
    } catch (e) {
      print(e);
    }
  } //Fetching data from API

  Column cryptoColumn() {
    List<CryptoCard> cryptoCards = [];
    for (String cpt in cryptoList) {
      cryptoCards.add(CryptoCard(
        cryptoCurrency: cpt,
        value: isWaiting ? '...' : coinValues[cpt],
        selectedCurrency: selectedCurrency,
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return Pricing(crypto: cpt ,coinValue: coinValues[cpt], selectedCurrency: selectedCurrency,);
          }));
        },
      ));
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: cryptoCards,
    );
  } //Generate custom cards

  @override
  void initState() {
    super.initState();
    getData();
  } //Getting data at first run

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🤑 Coin Ticker'),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 8,
              child: SingleChildScrollView(
                  child: cryptoColumn()),
            ),
            Expanded(
              flex: 2,
              child: Container(
                height: 100.0,
                alignment: Alignment.center,
                padding: const EdgeInsets.only(bottom: 30.0),
                color: Colors.lightBlue,
                child: Platform.isIOS ? iOSPicker() : androidDropdown(),
              ),
            )
          ],
        ),
      ),
    );
  }
}


