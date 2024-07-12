import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'coin.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  const PriceScreen({super.key});

  @override
  State<PriceScreen> createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedcurrency = 'USD';

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
                child: const Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 28.0, vertical: 15.0),
                  child: Text(
                    '1BTC = ? USD',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 26.0),
                  ),
                ),
              ),
            ),
            Container(
              height: 150.0,
              alignment: Alignment.center,
              color: Colors.lightBlue,
              padding: const EdgeInsets.only(bottom: 30.0),
              child: Platform.isIOS ? iosPicker() : getdropdownbutton(),
            ),
          ],
        ),
      ),
    );
  }
}
