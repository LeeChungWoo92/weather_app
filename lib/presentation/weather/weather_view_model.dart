import 'package:flutter/cupertino.dart';
import 'package:weather_app/domain/use_case/weather_info_use_case.dart';
import 'package:weather_app/presentation/weather/weather_ui_state.dart';

class WeatherViewModel with ChangeNotifier {
  final WeatherInfoUseCase _weatherInfoUseCase;

  WeatherViewModel(this._weatherInfoUseCase) {
    getWeatherInfo(37.55, 126.99);
  }

  WeatherUiState _state = const WeatherUiState();

  WeatherUiState get state => _state;

  void getWeatherInfo(double latitude, double longitude) async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();
    final result = await _weatherInfoUseCase.execute();
    try {
      _state = state.copyWith(weather: result, isLoading: false);
    } catch (e) {
      _state = state.copyWith(isLoading: false);
    }
    notifyListeners();
  }
}
