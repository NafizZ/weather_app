import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/home_provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});


  @override
  State<Home> createState() => _HomeState();
}


class _HomeState extends State<Home> {



  @override
  void initState() {
    super.initState();
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
      body:  dataModel.loading ? Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'loading....',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ) 
      : dataModel.dataExist == true ? Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            'temperature: ${(dataModel.data?.main?.temp - 273.15).toStringAsFixed(2)}° C',
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'tempMax: ${(dataModel.data?.main?.tempMax - 273.15).toStringAsFixed(2)}° C',
              ),
              Text(
                'tempMin: ${(dataModel.data?.main?.tempMin - 273.15).toStringAsFixed(2)}° C',
              ),
            ],
          ),
          Text(
            'FeelsLike: ${(dataModel.data?.main?.feelsLike - 273.15).toStringAsFixed(2)}° C',
          ),
          Text(
            'Pressure: ${dataModel.data?.main?.pressure}',
          ),
          Text("Wind"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'wind Speed: ${dataModel.data?.wind?.speed}',
              ),
              Text(
                'Wind Deg: ${dataModel.data?.wind?.deg}',
              ),
            ],
          )
        ],
      ) : Center(
        child: Text("NO Data found!"),
      )
    );
  }
}