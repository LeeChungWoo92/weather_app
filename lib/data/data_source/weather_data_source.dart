import '../dto/weather_dto.dart';

abstract interface class WeatherDataSource {
  Future<WeatherResultDto> getWeatherInfo(double latitude, double longitude);
}
