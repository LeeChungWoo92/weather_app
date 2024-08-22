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
      print('repoimpl try');
      final weatherInfoList = await _weatherDataSource.getWeatherInfo(latitude, longitude);
      //return weatherInfoList.map((e) => e.toWeather()).toList();
      print('repoimpl try list : ${weatherInfoList.toWeather()}');

      return weatherInfoList.toWeather();
    } catch (e) {
      print('repoimpl catch');
      return throw Exception('');
    }
  }
}
