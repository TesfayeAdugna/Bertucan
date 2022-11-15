import 'dart:async';
import 'dart:developer';

import 'package:bertucanfrontend/ui/controllers/gbv_controller.dart';
import 'package:bertucanfrontend/utils/constants.dart';
import 'package:bertucanfrontend/utils/functions.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GbvLocationPage extends StatefulWidget {
  const GbvLocationPage({Key? key}) : super(key: key);

  @override
  State<GbvLocationPage> createState() => _GbvLocationPageState();
}

class _GbvLocationPageState extends State<GbvLocationPage> {
  final Completer<GoogleMapController> _mapController = Completer();
  final Set<Marker> _marker = {};
  GbvController gbvController = Get.find();

  @override
  initState() {
    super.initState();
    gbvController.locateMe();
  }

  _onMapCreated(GoogleMapController controller) async {
    _mapController.complete(controller);
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: gbvController.currentLocation,
          zoom: 15,
        ),
      ),
    );
    setState(() {
      _marker.add(
        Marker(
          markerId: const MarkerId('currentPosition'),
          position: gbvController.currentLocation,
          infoWindow: InfoWindow(
            title: translate("your_current_position"),
            snippet: translate("you_are_here"),
          ),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        ),
      );
      if (gbvController.selectedGbv.address?.latitude != null &&
          gbvController.selectedGbv.address?.longitude != null) {
        log("locate: ${gbvController.selectedGbv.address?.latitude} ${gbvController.selectedGbv.address?.longitude}");
        _marker.add(
          Marker(
            markerId: const MarkerId('selectedGbvPosition'),
            position: LatLng(gbvController.selectedGbv.address!.latitude!,
                gbvController.selectedGbv.address!.longitude!),
            infoWindow: InfoWindow(
              title: gbvController.selectedGbv.name,
              snippet: gbvController.selectedGbv.address?.city,
            ),
          ),
        );
      }
    });
  }

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: kInitialLocation,
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: _kGooglePlex,
            onMapCreated: _onMapCreated,
            markers: _marker,
          ),
          Positioned(
            top: 20,
            child: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back,
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
