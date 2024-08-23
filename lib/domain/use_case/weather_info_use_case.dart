import 'package:geolocator/geolocator.dart';
import 'package:weather_app/domain/repository/weather_repository.dart';

import '../model/weather.dart';

class WeatherInfoUseCase {
  final WeatherRepository _weatherRepository;

  WeatherInfoUseCase(this._weatherRepository);

  Future<Position?> _getGeoData() async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return null;
        }
      }

      Position position = await Geolocator.getCurrentPosition();
      return position;
    } catch (e) {
      return null;
    }
  }

  Future<Weather> execute() async {
    try {
      final position = await _getGeoData();
      if (position != null) {
        final data = await _weatherRepository.getWeatherInfo(position.latitude, position.longitude);
        return data;
      } else {
        throw ('위치 정보를 가져오는데 실패했습니다.');
      }
    } catch (e) {
      throw ('use case error: $e');
    }
  }
}
