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
      : Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            '${dataModel.data?.main?.temp}',
            style: Theme.of(context).textTheme.headline4,
          ),
        ],
      ),
    );
  }
}