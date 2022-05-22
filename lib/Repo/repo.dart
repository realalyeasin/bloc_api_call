import 'dart:convert';

import 'package:bloc_api_call/Model/data_model.dart';
import 'package:http/http.dart' as http;

class Repo{
  Future getData() async {
    String API_KEY = 'f6b03a40c6343548c495430f4ed98e4468da3158';
    String url = 'https://api.geocodify.com/v2/geocode?api_key=$API_KEY&q=dhaka';
    final response = await http.Client().get(Uri.parse(url));
    if(response.statusCode == 200){
      var feeds = jsonDecode(response.body);
      print(feeds);
      return Feed.fromJson(feeds);
      } else if(response.statusCode != 200){
      return null;
    }
  }
}