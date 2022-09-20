import 'dart:convert';

import '../models/responses/weather_api_responses.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

const weatherApi = "https://api.openweathermap.org/data/2.5/weather?";

var apiKey = "f404230c73ff7d2afa795b92b72dddef";

Future<WeatherApiResponse?> getWeather(double lat, double lon) async{
  var url = Uri.parse("${weatherApi}lat=${lat}&lon=${lon}&appid=${apiKey}");
  var response = await http.get(
    url,
  );
  if(response.statusCode == 200){
    WeatherApiResponse data = WeatherApiResponse();
    try{
      data =  WeatherApiResponse.fromJson(jsonDecode(response.body));
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('weatherInfo', response.body);
    }catch(e){
      print(e);
    }
    return data; 
  }
  return null;
}