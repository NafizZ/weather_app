import 'package:flutter/material.dart';

import '../models/responses/weather_api_responses.dart';
import '../repositories/home_repository.dart';

class HomeProvider extends ChangeNotifier {
  WeatherApiResponse? data;
  bool loading = false;

  getWeatherData() async {
    loading = true;
    data = await getWeather();
    loading = false;

    notifyListeners();
  }
}