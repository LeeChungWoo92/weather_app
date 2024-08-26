import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/domain/model/weather.dart';
import 'package:weather_app/presentation/component/weather_item_widget.dart';

void main() {
  testWidgets('WeatherItemWidget displays correct data', (WidgetTester tester) async {
    // 가짜 Weather 데이터를 생성
    const weather = Weather(
      time: ['2024-08-22T20:00'],
      temperature: [25.0],
      weathercode: [1],
    );

    // WeatherItemWidget 위젯을 테스트 환경에 빌드
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: WeatherItemWidget(
          weather: weather,
          itemIndex: 0,
        ),
      ),
    ));

    // 시간 텍스트 검증
    expect(find.text('오후 8시'), findsOneWidget);

    // 아이콘 검증 (Mainly clear, partly cloudy, and overcast -> Icons.cloud)
    expect(find.byIcon(Icons.cloud), findsOneWidget);

    // 온도 텍스트 검증
    expect(find.text('25.0℃'), findsOneWidget);
  });

  group('WeatherIconMapper', () {
    test('returns correct icon for clear sky', () {
      expect(WeatherIconMapper.getWeatherIcon(0), Icons.wb_sunny);
    });

    test('returns correct icon for partly cloudy', () {
      expect(WeatherIconMapper.getWeatherIcon(1), Icons.cloud);
      expect(WeatherIconMapper.getWeatherIcon(2), Icons.cloud);
      expect(WeatherIconMapper.getWeatherIcon(3), Icons.cloud);
    });

    test('returns correct icon for fog', () {
      expect(WeatherIconMapper.getWeatherIcon(45), Icons.foggy);
      expect(WeatherIconMapper.getWeatherIcon(48), Icons.foggy);
    });

    test('returns default icon for unknown code', () {
      expect(WeatherIconMapper.getWeatherIcon(999), Icons.help_outline);
    });
  });
}
