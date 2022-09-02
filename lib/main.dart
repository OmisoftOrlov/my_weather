import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../business_logic_layer/astronomy_forecast_cubit/astronomy_forecast_cubit.dart';
import '../data_layer/repositories/weather_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Awesome Weather',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    WeatherRepository repository = WeatherRepository();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Lottie.asset("assets/lottie_animations/clear_day.json",
                  width: 200, height: 200),
              BlocBuilder<AstronomyForecastCubit, AstronomyForecastState>(
                  bloc: AstronomyForecastCubit(repository),
                  builder: (context, state) {
                    switch (state.runtimeType) {
                      case AstronomyForecastLoading:
                        return const CircularProgressIndicator();
                      case AstronomyForecastLoaded:
                        return Text(
                            (state as AstronomyForecastLoaded).astronomyForecast.toString());
                      case AstronomyForecastLoadingFailed:
                        return Text((state as AstronomyForecastLoadingFailed).errorMessage);
                      default:
                        return const Text("Something went wrong");
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
