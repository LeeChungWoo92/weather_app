import 'package:flutter/material.dart';

import '../../domain/model/weather.dart';
import '../../utils/date_time_utils.dart';



class WeatherItemWidget extends StatelessWidget {
  final Weather weather;
  final int itemIndex;

  const WeatherItemWidget({
    super.key,
    required this.weather,
    required this.itemIndex,
  });

  @override
  Widget build(BuildContext context) {
    final icon = WeatherIconMapper.getWeatherIcon(weather.weathercode[itemIndex] as int);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          _buildTime(),
          _buildIcon(icon),
          _buildTemperature(),
        ],
      ),
    );
  }

  Widget _buildTime() {
    return Expanded(
      child: SizedBox(
        height: 50,
        child: Center(
          child: Text(
            DateTimeUtils.extractHour(weather.time[itemIndex]),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIcon(IconData icon) {
    return Expanded(
      child: SizedBox(
        height: 50,
        child: Center(
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildTemperature() {
    return Expanded(
      child: SizedBox(
        height: 50,
        child: Center(
          child: Text(
            '${weather.temperature[itemIndex]}℃',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class WeatherIconMapper {
  static const Map<int, IconData> _weatherIconMap = {
    0: Icons.wb_sunny,
    // Clear sky
    1: Icons.cloud,
    2: Icons.cloud,
    3: Icons.cloud,
    // Mainly clear, partly cloudy, and overcast
    45: Icons.foggy,
    48: Icons.foggy,
    // Fog and depositing rime fog
    51: Icons.grain,
    53: Icons.grain,
    55: Icons.grain,
    // Drizzle: Light, moderate, and dense intensity
    56: Icons.ac_unit,
    57: Icons.ac_unit,
    // Freezing Drizzle: Light and dense intensity
    61: Icons.grain,
    63: Icons.grain,
    65: Icons.grain,
    // Rain: Slight, moderate and heavy intensity
    66: Icons.ac_unit,
    67: Icons.ac_unit,
    // Freezing Rain: Light and heavy intensity
    71: Icons.ac_unit,
    73: Icons.ac_unit,
    75: Icons.ac_unit,
    // Snow fall: Slight, moderate, and heavy intensity
    77: Icons.ac_unit,
    // Snow grains
    80: Icons.grain,
    81: Icons.grain,
    82: Icons.grain,
    // Rain showers: Slight, moderate, and violent
    85: Icons.ac_unit,
    86: Icons.ac_unit,
    // Snow showers slight and heavy
    95: Icons.flash_on,
    // Thunderstorm: Slight or moderate
    96: Icons.flash_on,
    99: Icons.flash_on,
    // Thunderstorm with slight and heavy hail
  };

  static IconData getWeatherIcon(int weatherCode) {
    return _weatherIconMap[weatherCode] ?? Icons.help_outline; // Default icon for unknown codes
  }
}
