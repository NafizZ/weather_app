import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:weather_app/services/location_service.dart';

import '../models/responses/weather_api_responses.dart';
import '../repositories/home_repository.dart';

class HomeProvider extends ChangeNotifier {
  WeatherApiResponse? data;
  bool loading = false;

  final _weatherBox = Hive.box<WeatherApiResponse>('weatherBox');

  void writeData(WeatherApiResponse? data){
    _weatherBox.add(data!);
    // _weatherBox.put('weather', data?.weather);
    // _weatherBox.put('main', data?.main);
  }

  void readData(){
    print("------${_weatherBox.getAt(0)?.main?.temp}");
    // var lat = _weatherBox.get('coord');

    // print(lat);
    // print(_weatherBox.get('weather'));
    // print(_weatherBox.get('main'));
  }

  double lat=23.35, long=90.33;

  // Future getLocation() async {
  //   final service = LocationService();
  //   final locationData = await service.getLocation();

  //   if(locationData != null){

  //     lat = double.parse((locationData.latitude!).toStringAsFixed(2));
  //     long = double.parse((locationData.longitude!).toStringAsFixed(2));

  //   }
  // }

  getWeatherData() async {
    loading = true;
    // await getLocation();
    if(await InternetConnectionChecker().hasConnection){

      final service = LocationService();
      final locationData = await service.getLocation();

      if(locationData != null){

        lat = double.parse((locationData.latitude!).toStringAsFixed(2));
        long = double.parse((locationData.longitude!).toStringAsFixed(2));

      }

    
      data = await getWeather(lat, long);
      if(data!=null){
        writeData(data);
     }
     print('internet connected!!');
    }
    else{
      print('internet not connected ');
      // if(_weatherBox.getAt(0) != null){
        // data = _weatherBox.getAt(0);
        print("---$data");
        readData();
      // }
    }
    
    loading = false;

    readData();
    notifyListeners();
  }
}