import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class AuthServer {
  bool isLogedIn = false ;
  String? _token ;

  Future <String?> LognIn(String? userName , String? password) async{
  //   try {
  //     final url = Uri.parse('http://10.0.2.2:8000/api/login');
  //     var header = {
  //       'Content-Type': 'application/json' ,
  //       'Authorization': 'Bearer' ,
  //     };
  //     dynamic body = {'userName': userName , 'password': password};
  //     http.Response respon = await http.post(
  //       url,
  //       headers: header,
  //       body: json.encode(body),
  //     );
  //     print(json.decode(respon.body));
  //     print('respon');
  //     print(respon.statusCode);
  //     final responData = json.decode(respon.body);
  //     _token = responData['data'];
  //     if (respon.statusCode != 200) {
  //       throw HttpException(
  //         responData['message'],
  //       );
  //     }
  //     final userData = json.encode({'data': _token});
  //   } catch (e) {
  //     throw e;
  //   }

  // } 
  }
}