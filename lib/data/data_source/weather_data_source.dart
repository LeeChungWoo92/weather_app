import '../dto/weather_dto.dart';

abstract interface class WeatherDataSource {
  Future<List<WeatherResultDto>> getWeatherInfo(double latitude, double longitude);
}
