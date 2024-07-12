import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'coin.dart';
//import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  const PriceScreen({super.key, this.coinrate});

  // ignore: prefer_typing_uninitialized_variables
  final dynamic coinrate;

  @override
  State<PriceScreen> createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedcurrency = 'USD';
  late String coinprice;

  DropdownButton<String> getdropdownbutton() {
    List<DropdownMenuItem<String>> mennuitem = [];
    for (String curr in currency) {
      var newitem = DropdownMenuItem(value: curr, child: Text(curr));
      mennuitem.add(newitem);
    }
    return DropdownButton<String>(
      value: selectedcurrency,
      items: mennuitem,
      onChanged: (value) {
        setState(() {
          selectedcurrency = value!;
        });
      },
    );
  }

  CupertinoPicker iosPicker() {
    List<Widget> items = [];
    for (String curr in currency) {
      var textitem = Text(curr);
      items.add(textitem);
    }
    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 32.0,
      onSelectedItemChanged: (selecteditem) {},
      children: items,
    );
  }

  @override
  void initState() {
    super.initState();
    updateUi(widget.coinrate);
  }

  void updateUi(dynamic data) {
    if (data == null) {
      coinprice = '0';
      return;
    }
    double rate = data['rate'];
    coinprice = rate.toStringAsFixed(0);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue,
          title: const Text(
            'Coin Ticker',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(left: 18.0, top: 18.0, right: 18.0),
              child: Card(
                color: Colors.lightBlue,
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 28.0, vertical: 15.0),
                  child: Text(
                    '1BTC = $coinprice $selectedcurrency',
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white, fontSize: 26.0),
                  ),
                ),
              ),
            ),
            Container(
                height: 150.0,
                alignment: Alignment.center,
                color: Colors.lightBlue,
                padding: const EdgeInsets.only(bottom: 30.0),
                child: iosPicker()
                //Platform.isIOS ? iosPicker() : getdropdownbutton(),
                ),
          ],
        ),
      ),
    );
  }
}
