import 'package:flutter/material.dart';

class CryptoCard extends StatelessWidget {
  const CryptoCard(
      {Key? key, this.value, this.selectedCurrency, this.cryptoCurrency, this.onTap})
      : super(key: key);

  final String? value;
  final String? selectedCurrency;
  final String? cryptoCurrency;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Card(
          color: Colors.lightBlueAccent,
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
            child: Text(
              '1 $cryptoCurrency = $value $selectedCurrency',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      onTap: onTap,
    );
  }
}