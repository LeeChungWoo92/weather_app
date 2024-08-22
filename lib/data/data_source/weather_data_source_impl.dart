import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/data/data_source/weather_data_source.dart';
import 'package:weather_app/data/dto/weather_dto.dart';

class WeatherDataSourceImpl implements WeatherDataSource {
  static const String _baseUrl =
      'https://api.open-meteo.com/v1/forecast?hourly=temperature_2m,weathercode,relativehumidity_2m,windspeed_10m,pressure_msl';

  @override
  Future<List<WeatherResultDto>> getWeatherInfo(double latitude, double longitude) async {
    final String url = '$_baseUrl&latitude=$latitude&longitude=$longitude';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final List jsonResponse = jsonDecode(response.body)['hourly'];
      return jsonResponse.map((e) => WeatherResultDto.fromJson(e)).toList();
    } else {
      throw Exception('');
    }
  }
}
