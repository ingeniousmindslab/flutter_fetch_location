import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeController extends GetxController {
  String currentAddress = '';
  // ignore: non_constant_identifier_names
  RxString address = "".obs;
  String location = '';
  RxString city = ''.obs;
  RxString country = ''.obs;
  RxDouble lat = 0.0.obs;
  RxDouble lang = 0.0.obs;
  RxBool isLoading = false.obs;
  Set<Marker> marker = <Marker>{}.obs; // Inside Map View Controller

  void onMapCreated(GoogleMapController googleMapController) {
    double latitude = lat.value;
    double longitude = lang.value;

    marker.add(
      Marker(
        markerId: const MarkerId("MarkerId"),
        position: LatLng(latitude, longitude),
      ),
    );
  }

  Future<Position> getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Future<void> getAddressFromLatLong(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemarks);
    Placemark place = placemarks[0];

    country.value = place.country ?? "Not Avaliable";
    city.value = place.locality ?? "Not Avaliable";

    address.value =
        '${place.street} ${place.locality} ${place.subLocality} ${place.administrativeArea} ${place.country}';
  }

  Future getUsersData() async {
    isLoading.value = true;
    Position position = await getGeoLocationPosition();
    lat.value = position.latitude;
    lang.value = position.longitude;
    await getAddressFromLatLong(position);
    isLoading.value = false;
  }

  @override
  void onReady() {}

  @override
  void onClose() {}
}
