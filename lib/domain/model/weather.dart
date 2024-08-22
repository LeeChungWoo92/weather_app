import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather.freezed.dart';

part 'weather.g.dart';

@freezed
class Weather with _$Weather {
  const factory Weather({
    required List<String> time,
    required List<num> temperature,
    required List<num> weathercode,


  }) = _Weather;
  
  factory Weather.fromJson(Map<String, Object?> json) => _$WeatherFromJson(json); 
}