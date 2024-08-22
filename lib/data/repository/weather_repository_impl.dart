import 'package:weather_app/data/data_source/weather_data_source.dart';
import 'package:weather_app/data/mapper/weather_mapper.dart';
import 'package:weather_app/domain/repository/weather_repository.dart';
import '../../domain/model/weather.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherDataSource _weatherDataSource;

  WeatherRepositoryImpl(this._weatherDataSource);

  @override
  Future<Weather> getWeatherInfo(double latitude, double longitude) async {
    try {
      final weatherInfoList = await _weatherDataSource.getWeatherInfo(latitude, longitude);
      return weatherInfoList.toWeather();
    } catch (e) {
      return throw Exception('');
    }
  }
}
