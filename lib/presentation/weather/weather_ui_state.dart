import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/model/weather.dart';

part 'weather_ui_state.freezed.dart';

part 'weather_ui_state.g.dart';

@freezed
class WeatherUiState with _$WeatherUiState {
  const factory WeatherUiState({
    Weather? weather,
    @Default(false) bool isLoading,
  }) = _WeatherUiState;

  factory WeatherUiState.fromJson(Map<String, Object?> json) => _$WeatherUiStateFromJson(json);
}
