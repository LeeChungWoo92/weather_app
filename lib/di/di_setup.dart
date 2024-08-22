import 'package:get_it/get_it.dart';
import 'package:weather_app/data/data_source/weather_data_source.dart';
import 'package:weather_app/data/data_source/weather_data_source_impl.dart';
import 'package:weather_app/data/repository/weather_repository_impl.dart';
import 'package:weather_app/domain/repository/weather_repository.dart';
import 'package:weather_app/domain/use_case/weather_info_use_case.dart';
import 'package:weather_app/presentation/weather/weather_view_model.dart';

final getIt = GetIt.instance;

void diSetUp() {
  getIt.registerSingleton<WeatherDataSource>(WeatherDataSourceImpl());
  getIt.registerSingleton<WeatherRepository>(WeatherRepositoryImpl(getIt()));

  getIt.registerSingleton(WeatherInfoUseCase(getIt()));

  getIt.registerFactory<WeatherViewModel>(() => WeatherViewModel(getIt()));
}
