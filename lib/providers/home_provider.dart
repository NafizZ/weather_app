import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/services/location_service.dart';

import '../models/responses/weather_api_responses.dart';
import '../repositories/home_repository.dart';

class HomeProvider extends ChangeNotifier {
  WeatherApiResponse? data;
  bool loading = false;
  bool dataExist = false;

  double lat=23.35, long=90.33;


  getWeatherData() async {
    loading = true;

    if(await InternetConnectionChecker().hasConnection){

      final service = LocationService();
      final locationData = await service.getLocation();

      if(locationData != null){

        lat = double.parse((locationData.latitude!).toStringAsFixed(2));
        long = double.parse((locationData.longitude!).toStringAsFixed(2));

      }

    
      data = await getWeather(lat, long);
      dataExist = true;
     print('internet connected!!');
    }
    else{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      if(prefs.containsKey('weatherInfo')){
        dataExist = true;
        print('internet not connected ');
        String? weatherInfo = prefs.getString('weatherInfo');

        data = WeatherApiResponse.fromJson(jsonDecode(weatherInfo!));
      }      
    }
    
    loading = false;

    notifyListeners();
  }
}