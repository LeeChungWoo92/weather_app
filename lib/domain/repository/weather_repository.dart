import '../model/weather.dart';

abstract interface class WeatherRepository {
  Future<Weather> getWeatherInfo(double latitude, double longitude);
}
