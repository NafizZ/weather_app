import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
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
        child: Image.asset('assets/images/giphy_loading.gif',
          height: 178,
          width: 234,
          opacity: const AlwaysStoppedAnimation<double>(0.5)
        ),
      ) 
      : dataModel.dataExist == true ? Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: RadialGradient(
                radius: 0.85,
                colors: [
                  gradientColor1,
                  gradientColor2,
                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Today It Feels like",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w400,
                        color: textColor,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      "${(dataModel.data?.main?.feelsLike - 273.15).toStringAsFixed(1)}° C",
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w500,
                        color: textColor,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),

              Image.asset('assets/images/giphy_home.gif',
                height: 190,
                width: 260,
              ),

              Column(
                children: [
                  Center(
                    child: Text(
                      "${(dataModel.data?.main?.temp - 273.15).toStringAsFixed(1)}° C",
                      style: const TextStyle(
                        fontSize: 68,
                        fontWeight: FontWeight.w500,
                        color: textColor,
                      ),
                    ),
                  ),
                  Text(
                    "Country: ${dataModel.data?.sys?.country}",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: textColor,
                    ),
                    textAlign: TextAlign.right,
                  )
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Card(
                    shape: RoundedRectangleBorder(  
                      borderRadius: BorderRadius.circular(15.0),  
                    ),  
                    child: SizedBox(
                      height: 105,
                      width: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "Humidity",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: textColor,
                            ),
                          ),
                          Text(
                            "${dataModel.data?.main?.humidity}",
                            style: cardValueTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(  
                      borderRadius: BorderRadius.circular(15.0),  
                    ),  
                    child: SizedBox(
                      height: 105,
                      width: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "Max Temp",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: textColor,
                            ),
                          ),
                          Text(
                            "${(dataModel.data?.main?.tempMax - 273.15).toStringAsFixed(1)}° C",
                            style: cardValueTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(  
                      borderRadius: BorderRadius.circular(15.0),  
                    ),  
                    child: SizedBox(
                      height: 105,
                      width: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "Wind Speed",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: textColor,
                            ),
                          ),
                          Text(
                            "${dataModel.data?.wind?.speed}",
                            style: cardValueTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ) : const Center(
        child: Text("NO Data found!"),
      )
    );
  }
}