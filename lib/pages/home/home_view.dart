import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../common/widgets/custom_button.dart';
import '../../common/widgets/custome_card.dart';
import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => HomeController());
    return Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: RadialGradient(
                radius: 2.0,
                center: Alignment(0.1, 0.8),
                colors: [
                  Color(0xffF0C97C),
                  Color(0xffEDAA51),
                ],
              ),
            ),
          ),
          centerTitle: true,
          title: const Text(
            "Location Fetcher",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Obx(
            () => CustomButton(
              function: () {
                if (controller.isLoading.value == false) {
                  controller.getUsersData();
                }
              },
              text: controller.isLoading.value
                  ? "Please Wait"
                  : "Fetch My Location",
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Obx(
            () => Column(
              children: [
                CustomCard(
                  title: "Latitude",
                  subTitle: controller.lat.value == 0.0
                      ? "Not Avaliable"
                      : "${controller.lat.value}",
                  redius: 14,
                ),
                CustomCard(
                  title: "Longitude",
                  subTitle: controller.lang.value == 0.0
                      ? "Not Avaliable"
                      : "${controller.lang.value}",
                  redius: 14,
                ),
                CustomCard(
                  title: "Country",
                  subTitle: controller.country.value.isEmpty
                      ? "Not Avaliable"
                      : controller.country.value,
                  redius: 14,
                ),
                CustomCard(
                  title: "City",
                  subTitle: controller.city.value.isEmpty
                      ? "Not Avaliable"
                      : controller.city.value,
                  redius: 14,
                ),
                CustomCoumnCard(
                  title: "Address",
                  subTitle: controller.address.value.isEmpty
                      ? "Not Avaliable"
                      : controller.address.value,
                  redius: 14,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: Visibility(
                    visible: controller.lat.value != 0.0,
                    child: SizedBox(
                      width: Get.width,
                      height: Get.height * 0.28,
                      child: GoogleMap(
                        buildingsEnabled: true,
                        compassEnabled: true,
                        zoomControlsEnabled: true,
                        zoomGesturesEnabled: true,
                        onMapCreated: controller.onMapCreated,
                        markers: controller.marker,
                        initialCameraPosition: CameraPosition(
                          target: LatLng(
                              controller.lat.value, controller.lang.value),
                          zoom: 12,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
