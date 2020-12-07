import '../services/location.dart';
import '../services/networking.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

final String apiKey = DotEnv().env['APIKEY'];
const String openWeatherMapURL =
    'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networker = NetworkHelper(
        url: '$openWeatherMapURL?q=$cityName&units=metric&appid=$apiKey');

    var weatherData = await networker.getData();

    return weatherData;
  }

  Future<dynamic> getLocationData() async {
    Locator loc = Locator();

    await loc.getCurrentLocation();
    print(
        '$openWeatherMapURL?lat=${loc.getLatitude()}&lon=${loc.getLongitude()}&units=metric&appid=$apiKey');
    NetworkHelper networker = NetworkHelper(
        url:
            '$openWeatherMapURL?lat=${loc.getLatitude()}&lon=${loc.getLongitude()}&units=metric&appid=$apiKey');

    var weatherData = await networker.getData();

    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
