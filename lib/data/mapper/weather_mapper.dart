import 'package:weather_app/data/dto/weather_dto.dart';
import 'package:weather_app/domain/model/weather.dart';

extension WeatherMapper on WeatherResultDto {
  Weather toWeather() {
    return Weather(
      time: time ?? [],
      temperature: temperature2m as List<double>? ?? [],
      weathercode: weathercode as List<int>? ?? [],
    );
  }
}
