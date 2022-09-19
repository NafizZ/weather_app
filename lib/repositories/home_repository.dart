import 'dart:convert';

import '../models/responses/weather_api_responses.dart';

import 'package:http/http.dart' as http;

const weatherApi = "https://api.openweathermap.org/data/2.5/weather?";
//
double lat = 23.76;
double lon = 90.37;
var apiKey = "f404230c73ff7d2afa795b92b72dddef";

Future<WeatherApiResponse?> getWeather() async{
  var url = Uri.parse(weatherApi+"lat=$lat&lon=$lon&appid=$apiKey");
  print(url);
  var response = await http.get(
    url,
  );
  if(response.statusCode == 200){
    WeatherApiResponse data = WeatherApiResponse();
    try{
      data =  WeatherApiResponse.fromJson(jsonDecode(response.body));
      print("data: ${data.main?.temp}");
    }catch(e){
      print(e);
    }
    return data; 
  }
  return null;
}