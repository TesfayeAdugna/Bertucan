import 'dart:developer';
import 'dart:ui';

import 'package:bertucanfrontend/core/models/simple_models.dart';
import 'package:bertucanfrontend/shared/routes/app_routes.dart';
import 'package:bertucanfrontend/shared/translations/untracked.dart';
import 'package:bertucanfrontend/utils/confirm_dialog.dart';
import "package:geolocator/geolocator.dart";
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

/// Determine the current position of the device.
/// When the location services are not enabled or permissions
/// are denied the `Future` will return an error.
Future<Position> getCurrentLocation() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the
    // App to enable the location services
    Get.dialog(ConfirmDialog(
      title: translate("enable_location"),
      content: translate("enable_location_info"),
      actionText: 'ok',
      actionCallback: () => Geolocator.openLocationSettings(),
    ));

    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  print(permission);
  if (permission == LocationPermission.deniedForever) {
    Get.dialog(ConfirmDialog(
      title: translate("\"Bertucan\" requires Location Services to work"),
      content:
          'Go to Setting to allow "Taxiye" to determine your location. This will help us set your pickup location and improve our services.'
              .tr,
      actionText: 'ok',
      actionCallback: () => Geolocator.openLocationSettings(),
    ));
  }
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  return await Geolocator.getCurrentPosition();
}

String getInitialRoute() {
  GetStorage storage = GetStorage();
  if (storage.hasData('user_log_data')) {
    if (storage.hasData('passcode')) {
      return Routes.lockScreenPage;
    }
    return Routes.homePage;
  } else {
    if (!storage.hasData('token')) {
      return Routes.introPage;
    } else {
      return Routes.questionnairePage;
    }
  }
}

Locale getInitialLocale() {
  GetStorage storage = GetStorage();
  if (storage.hasData('locale')) {
    return Locale(storage.read('locale'));
  } else {
    return const Locale('am', 'ET');
  }
}

void toast(String title, String message) {
  addToTranslation(title);
  addToTranslation(message);
  Get.snackbar(title.tr, message.tr, snackPosition: SnackPosition.BOTTOM);
}

addToTranslation(String key) {
  // key = "'$key'";
  // UntrackedKeys.untracked.putIfAbsent(key, () => "''");
  // log("untracked length ${UntrackedKeys.untracked.length.toString()}");
  // log(UntrackedKeys.untracked.toString());
}

String translate(String key) {
  addToTranslation(key);
  return key.tr;
}

String getChanceOfPregnancy(
    DateTime day, MonthlyMensturationModel mensturation) {
  if ((day.isAfter(mensturation.pregnancyDate!.subtract(Duration(days: 2)))) &&
      (day.isBefore(mensturation.pregnancyDate!.add(Duration(days: 2))))) {
    return translate('high');
  } else if (day
          .isBefore(mensturation.pregnancyDate!.subtract(Duration(days: 2))) &&
      day.isAfter(mensturation.endDate)) {
    return translate('normal');
  } else {
    return translate('low');
  }
}
