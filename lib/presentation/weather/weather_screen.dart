import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/presentation/weather/weather_view_model.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('현재 위치 날씨'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerRight,
              child: InkWell(
                  onTap: () {
                    print('내 위치 클릭');
                  },
                  child: const Icon(Icons.my_location)),
            ),
            weatherInfoList(context),
          ],
        ),
      ),
    );
  }

  Widget weatherInfoList(BuildContext context) {
    final viewModel = context.watch<WeatherViewModel>();
    //viewModel.getWeatherInfo(37.55, 127.0);

    return Column(
      children: [
        const SizedBox(width: 5),
        Text(viewModel.state.weather!.time[0]),
        const SizedBox(height: 20),
        Text(viewModel.state.weather!.temperature[0].toString()),
        const SizedBox(height: 20),
        Text(viewModel.state.weather!.weathercode[0].toString()),
      ],
    );
  }
}
