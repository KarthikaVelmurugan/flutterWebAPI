import 'service.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'service.dart';

class ServiceApi {
  static const url = "http://localhost/messfeeDB/api.php";

  static Future<List<Service>> getDetails() async {

      final response = await http.post(
          Uri.encodeFull(url), headers: {"Accept": "application/json"});
      print("Response:${response.body}");

      if (200 == response.statusCode) {

        List<Service> list = parseResponse(response.body);
        print(list);
        return list;
      }
      else
        {
          print("list not created");
        }


  }
  static List<Service> parseResponse(String resbody){
    //var map = Map<String, dynamic>();
    final parsed= json.decode(resbody).cast<Map<String, dynamic>>();

    return parsed.map<Service>((json) => Service.fromJson(json)).toList();

  }}























