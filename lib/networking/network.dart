import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  
  NetworkHelper(this.url);
  final Uri url;

  Future getRate()async{
    http.Response response = await http.get(url);

    if(response.statusCode == 200){
      var data =  jsonDecode(response.body);
      return data;
    }else{
      // ignore: avoid_print
      print(response.statusCode);
    }
    
  }


  
}


