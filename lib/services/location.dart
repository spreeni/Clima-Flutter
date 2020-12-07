import 'package:geolocator/geolocator.dart';

class Locator {
  double _latitude;
  double _longitude;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);

      this._latitude = position.latitude;
      this._longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }

  double getLatitude() => this._latitude;

  double getLongitude() => this._longitude;
}
