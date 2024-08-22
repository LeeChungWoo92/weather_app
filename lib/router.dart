import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/presentation/weather/weather_screen.dart';
import 'package:weather_app/presentation/weather/weather_view_model.dart';

import 'di/di_setup.dart';

final router = GoRouter(
  initialLocation: '/home',
  routes: [
    GoRoute(
      path: '/home',
      builder: (context, state) {
        return ChangeNotifierProvider<WeatherViewModel>(
          create: (context) => getIt<WeatherViewModel>(),
          child: const WeatherScreen(),
        );
      },
    ),
  ],
);
