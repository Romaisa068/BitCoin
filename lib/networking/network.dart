import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  
  NetworkHelper(this.url);
  final Uri url;

  Future getRate()async{
    http.Response response = await http.get(url);

    if(response.statusCode == 200){
      return  jsonDecode(response.body);
       
    }else{
      // ignore: avoid_print
      print(response.statusCode);
    }
    
  }


  
}


