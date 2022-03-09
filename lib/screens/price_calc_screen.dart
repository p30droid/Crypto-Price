import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utilities/const_properties.dart';

class Pricing extends StatefulWidget {
  const Pricing({Key? key, this.coinValue, this.selectedCurrency, this.crypto})
      : super(key: key);

  final coinValue;
  final selectedCurrency;
  final crypto;

  @override
  State<Pricing> createState() => _PricingState();
}

class _PricingState extends State<Pricing> {

  final TextEditingController _textController = TextEditingController();
  dynamic result = 0.0000;

  void _changePrice(){
    setState((){
      result = double.parse(_textController.text) * double.parse(widget.coinValue);
    });
  } //convert string to double

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crypto Calculator'),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                flex: 3,
                child: Card(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        '1 ${widget.crypto} = ${widget.coinValue} ${widget.selectedCurrency}',
                        style: const TextStyle(fontSize: 26),
                      ),
                    ),
                  ),
                )),
            Expanded(
                flex: 7,
                child: Center(
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      SizedBox(
                        width: 150,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          controller: _textController,
                          style: const TextStyle(color: Colors.black),
                          decoration: textFieldDecoration,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      ElevatedButton.icon(
                        onPressed: _changePrice,
                        icon: const Icon(
                          Icons.calculate_outlined,
                          color: Colors.white,
                        ),
                        label: (const Text('Calculate')),
                        style: buttonStyleFrom,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: 150,
                        padding: const EdgeInsets.all(15.0),
                        decoration: boxContainerDecoration,
                        child: Text(
                          '💵 $result ${widget.selectedCurrency}',
                          style: const TextStyle(color: Colors.black),
                        ),
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
