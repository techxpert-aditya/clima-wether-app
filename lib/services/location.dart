import 'package:geolocator/geolocator.dart';

class Location {
  late double longitude;
  late double latitude;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      // ignore: avoid_print
      longitude = position.longitude;
      latitude = position.latitude;
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  // ignore: unnecessary_null_comparison
  bool get hasLocation => longitude != null && latitude != null;
}
