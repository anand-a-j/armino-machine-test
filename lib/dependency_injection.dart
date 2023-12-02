import 'package:get_it/get_it.dart';
import 'package:simple_weather_app/features/weather/data/data_source/remote_data_source.dart';
import 'package:simple_weather_app/features/weather/data/repository/weather_repository_impl.dart';
import 'package:simple_weather_app/features/weather/domain/repository/weather_repository.dart';
import 'package:simple_weather_app/features/weather/domain/usecases/get_current_weather.dart';
import 'package:simple_weather_app/features/weather/presentation/bloc/weather/weather_bloc.dart';
import 'package:http/http.dart' as http;

final locator = GetIt.instance;

void setUpLocator() {
  // bloc
  locator.registerFactory(() => WeatherBloc(locator()));

  // usecase
  locator.registerLazySingleton(() => GetCurrentWeatherUseCase(locator()));

  // repositories
  locator.registerLazySingleton<WeatherRepository>(
      () => WeatherRepositoryImpl(weatherRemoteDataSource: locator()));

  // data source
  locator.registerLazySingleton<WeatherRemoteDataSource>(
      () => WeatherRemoteDataSourceImpl(client: locator()));

  // external
  locator.registerLazySingleton(() => http.Client());
}
