import 'package:bitcoin/networking/loading_screen.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const BitCoin());
}

class BitCoin extends StatelessWidget {
  const BitCoin({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Network();
  }
}