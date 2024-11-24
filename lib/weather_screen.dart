import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather_app/additional_item.dart';
import 'package:weather_app/hourly_forecast.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  bool isLoading = false;

  Future<void> refreshWeatherData() async {
    setState(() {
      isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Weather App',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
              padding: const EdgeInsets.all(10.0),
              child: IconButton(
                onPressed: refreshWeatherData,
                icon: const Icon(
                  Icons.refresh,
                ),
              ))
        ],
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator.adaptive(),
            )
          : Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Main Card 220
                  SizedBox(
                    width: double.infinity,
                    child: Card(
                      color: Colors.blueGrey,
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 10,
                            sigmaY: 10,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '300.67°F',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 32,
                                  ),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Icon(
                                  Icons.cloud,
                                  size: 48,
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  'Rain',
                                  style: TextStyle(
                                    color: Colors.white,
                                    //fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Weather ForeCast',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  //Weather ForeCast
                  const SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        HourlyForecast(
                          time: '00:00',
                          icon: Icons.cloud,
                          temperature: '300.203',
                        ),
                        HourlyForecast(
                          time: '09:00',
                          icon: Icons.sunny,
                          temperature: '400.000',
                        ),
                        HourlyForecast(
                          time: '11:00',
                          icon: Icons.cloud,
                          temperature: '301.203',
                        ),
                        HourlyForecast(
                          time: '15:00',
                          icon: Icons.sunny,
                          temperature: '345.203',
                        ),
                        HourlyForecast(
                          time: '20:00',
                          icon: Icons.ac_unit,
                          temperature: '200.12',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // Additional Information
                  const Text(
                    'Additional Information',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      AdditionalItem(
                          icon: Icons.water_drop_sharp,
                          label: 'Humidity',
                          value: '94'),
                      AdditionalItem(
                        icon: Icons.air,
                        label: 'Wind Speed',
                        value: '7.67',
                      ),
                      AdditionalItem(
                        icon: Icons.beach_access,
                        label: 'Presure',
                        value: '1006',
                      ),
                    ],
                  )
                ],
              ),
            ),
    );
  }
}
