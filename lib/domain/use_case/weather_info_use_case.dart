import 'package:weather_app/domain/repository/weather_repository.dart';

import '../model/weather.dart';

class WeatherInfoUseCase {
  final WeatherRepository _weatherRepository;

  WeatherInfoUseCase(this._weatherRepository);

  Future<Weather> execute(double latitude, double longitude) async {
    try {
      final data = await _weatherRepository.getWeatherInfo(latitude, longitude);
      return data;
    } catch (e) {
      return throw ('use case error');
    }
  }
}
