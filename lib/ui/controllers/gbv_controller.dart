import 'dart:math';

import 'package:bertucanfrontend/core/adapters/gbv_adapters.dart';
import 'package:bertucanfrontend/core/models/freezed_models.dart';
import 'package:bertucanfrontend/shared/routes/app_routes.dart';
import 'package:bertucanfrontend/utils/constants.dart';
import 'package:bertucanfrontend/utils/functions.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GbvController extends GetxController {
  final IGbvRepository _gbvRepository;
  GbvController(this._gbvRepository);

  final _status = RxStatus.empty().obs;
  RxStatus get status => _status.value;
  set status(RxStatus value) {
    _status.value = value;
  }

  //varicale for current location
  final _currentLocation = kInitialLocation.obs;
  LatLng get currentLocation => _currentLocation.value;
  set currentLocation(LatLng value) {
    _currentLocation.value = value;
  }

  final _gbvies = <Gbv>[].obs;
  List<Gbv> get gbvies => _gbvies;
  set gbvies(List<Gbv> value) {
    _gbvies.value = value;
  }

  final _gbviesToShow = <Gbv>[].obs;
  List<Gbv> get gbviesToShow => _gbviesToShow;
  set gbviesToShow(List<Gbv> value) {
    _gbviesToShow.value = value;
  }

  final _selectedGbv = Gbv(id: -1).obs;
  Gbv get selectedGbv => _selectedGbv.value;
  set selectedGbv(Gbv value) {
    _selectedGbv.value = value;
  }

  //oninit
  @override
  void onInit() async {
    super.onInit();
    locateMe();
  }

  locateMe() async {
    await getCurrentLocation().then((value) {
      currentLocation = LatLng(value.latitude, value.longitude);
    });
  }

  Future<void> getGbvies() async {
    status = RxStatus.loading();
    gbvies = [];
    gbviesToShow = [];
    await _gbvRepository.getGbvies().then((value) {
      if (value != null) {
        gbvies = value;
        gbviesToShow = value;
        status = RxStatus.success();
      } else {
        status = RxStatus.error(translate("no_data"));
      }
    }).catchError((error) {
      status = RxStatus.error(error);
    });
  }

  Future<void> selectGbv(Gbv gbv) async {
    selectedGbv = gbv;
    Get.toNamed(Routes.gbvDetailPage);
  }

  void searchGbvByName(String name) {
    if (name.isNotEmpty) {
      gbviesToShow = [];
      gbviesToShow.addAll(gbvies.where((gbv) =>
          (gbv.name ?? "").toLowerCase().contains(name.toLowerCase())));
    } else {
      gbviesToShow = gbvies;
    }
  }

  void sortGbviesByLocation() {
    status = RxStatus.loading();
    gbviesToShow.sort((a, b) {
      if (a.address?.latitude == null ||
          a.address?.longitude == null ||
          b.address?.latitude == null ||
          b.address?.longitude == null) {
        return 0;
      }
      double distanceA = calculateDistance(
          LatLng(a.address!.latitude!, a.address!.longitude!));
      double distanceB = calculateDistance(
          LatLng(b.address!.latitude!, b.address!.longitude!));
      return distanceA.compareTo(distanceB);
    });
    status = RxStatus.success();
  }

  double calculateDistance(LatLng loc1) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((currentLocation.latitude - loc1.latitude) * p) / 2 +
        c(loc1.latitude * p) *
            c(currentLocation.latitude * p) *
            (1 - c((currentLocation.longitude - loc1.longitude) * p)) /
            2;
    return 12742 * asin(sqrt(a));
  }

  Future<void> reportGbv(GbvReport report) async {
    status = RxStatus.loading();
    await _gbvRepository.reportGbv(report).then((value) {
      value.success
          ? {
              Get.back(),
              status = RxStatus.success(),
            }
          : status = RxStatus.error();
    }).catchError((onError) {
      status = RxStatus.error();
    });
  }
}
