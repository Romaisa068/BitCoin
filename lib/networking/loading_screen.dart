import 'package:bitcoin/networking/network.dart';
import 'package:bitcoin/price_screen.dart';
import 'package:flutter/material.dart';

  const String address = 'https://rest.coinapi.io/v1/exchangerate/BTC';

  const String apikey = '003BE7DD-5BF9-4BB5-B9EE-81C2F1624D8D';

class Network extends StatefulWidget {
  const Network({super.key});

  @override
  State<Network> createState() => _NetworkState();
}

class _NetworkState extends State<Network> {


  final Uri url = Uri.parse(
      '$address/USD?apikey=$apikey');


  void getData() async {
    NetworkHelper networkHelper = NetworkHelper(url);

     try {
    var coindata = await networkHelper.getRate();

    // ignore: use_build_context_synchronously
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return PriceScreen(coinrate: coindata);
    }));
  } catch (e) {
    // ignore: avoid_print
    print('Error fetching data: $e');
  }
  }

  @override
  void initState() {
    
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            color: Colors.lightBlue,
          ),
        ), 
      );
  }
}



// curl -L -X GET 'https://rest.coinapi.io/v1/exchangerate/BTC' \
// -H 'Accept: text/plain' \
// -H 'X-CoinAPI-Key: 003BE7DD-5BF9-4BB5-B9EE-81C2F1624D8D'