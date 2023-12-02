class Urls {
  static const String baseUrl = 'https://api.openweathermap.org/data/2.5';
  static const String apiKey = '66caf3684ab7f491e7c49582258b9e08';

  static String currentWeatherByLatLong(double latitude, double longitude) =>
      '$baseUrl/weather?lat=$latitude&lon=$longitude&appid=$apiKey';

  static String weatherIcon(String iconCode) =>
      'http://openweathermap.org/img/wn/$iconCode@2x.png';
}
