import 'package:flutter/material.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather"),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
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