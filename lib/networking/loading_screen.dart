import 'package:bitcoin/networking/network.dart';
import 'package:bitcoin/price_screen.dart';
import 'package:flutter/material.dart';

class Network extends StatefulWidget {
  const Network({super.key});

  @override
  State<Network> createState() => _NetworkState();
}

class _NetworkState extends State<Network> {
  final String address = 'https://rest.coinapi.io/v1/exchangerate/BTC';

  final String apikey = '003BE7DD-5BF9-4BB5-B9EE-81C2F1624D8D';

  final Uri url = Uri.parse(
      'https://rest.coinapi.io/v1/exchangerate/BTC/USD?apikey=003BE7DD-5BF9-4BB5-B9EE-81C2F1624D8D');

  

  void getData() async {
    NetworkHelper networkHelper = NetworkHelper(url);

    var coindata = await networkHelper.getRate();

    // ignore: use_build_context_synchronously
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return PriceScreen(coinrate: coindata);
    }));
  }

  @override
  void initState() {
    
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            color: Colors.lightBlue,
          ),
        ), 
      ),
    );
  }
}



// curl -L -X GET 'https://rest.coinapi.io/v1/exchangerate/BTC' \
// -H 'Accept: text/plain' \
// -H 'X-CoinAPI-Key: 003BE7DD-5BF9-4BB5-B9EE-81C2F1624D8D'