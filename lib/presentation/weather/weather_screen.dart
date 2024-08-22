import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/presentation/weather/weather_view_model.dart';

import '../../domain/model/weather.dart';
import '../component/weather_item_widget.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  double? latitude;
  double? longitude;

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  Future<void> _initialize() async {
    await _getGeoData();
    if (latitude != null && longitude != null) {
      _fetchWeather();
    }
  }

  Future<void> _getGeoData() async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          _showError('위치 권한이 없습니다.');
          return;
        }
      }

      Position position = await Geolocator.getCurrentPosition();
      setState(() {
        latitude = position.latitude;
        longitude = position.longitude;
      });
    } catch (e) {
      _showError('위치를 가져오는데 실패했습니다.');
    }
  }

  void _fetchWeather() {
    final viewModel = context.read<WeatherViewModel>();
    viewModel.getWeatherInfo(latitude!, longitude!);
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<WeatherViewModel>();
    final state = viewModel.state;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/sky_background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 60),
            Container(
              alignment: Alignment.centerRight,
              child: IconButton(
                icon: const Icon(
                  Icons.my_location,
                  color: Colors.black,
                  size: 35,
                ),
                onPressed: _initialize,
              ),
            ),
            const SizedBox(height: 50),
            if (state.isLoading)
              const Expanded(
                child: Center(child: CircularProgressIndicator()),
              )
            else if (state.weather != null)
              Expanded(
                  child: Card(
                      //color: const Color(0xFFCCEEFF),
                      color: Colors.transparent,
                      child: weatherInfoList(
                        state.weather!,
                      )))
            else
              const Expanded(
                child: Center(child: Text('날씨 정보를 불러올 수 없습니다.')),
              ),
          ],
        ),
      ),
    );
  }

  Widget weatherInfoList(Weather weather) {
    return ListView.builder(
      itemCount: weather.time.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: WeatherItemWidget(
            weather: weather,
            itemIndex: index,
          ),
        );
      },
    );
  }
}
