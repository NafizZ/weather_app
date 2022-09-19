import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/home_provider.dart';
import '../services/location_service.dart';

class Home extends StatefulWidget {
  const Home({super.key});


  @override
  State<Home> createState() => _HomeState();
}


class _HomeState extends State<Home> {

  String? lat, long, country, adminArea;

  void getLocation() async {
    final service = LocationService();
    final locationData = await service.getLocation();

    if(locationData != null){


      setState(() {
        lat = locationData.latitude!.toStringAsFixed(2);
        long = locationData.longitude!.toStringAsFixed(2);

      });
    }
  }

  @override
  void initState() {
    super.initState();
    getLocation();
    final dataModel = Provider.of<HomeProvider>(context, listen: false);
    dataModel.getWeatherData();
  }

  @override
  Widget build(BuildContext context) {
    final dataModel = Provider.of<HomeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather"),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'lat= $lat long= $long',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
    );
  }
}