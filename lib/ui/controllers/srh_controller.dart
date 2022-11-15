import 'package:bertucanfrontend/core/adapters/srh_adapter.dart';
import 'package:bertucanfrontend/core/models/freezed_models.dart';
import 'package:bertucanfrontend/core/repositories/srh_repository.dart';
import 'package:bertucanfrontend/core/services/api/api_client.dart';
import 'package:bertucanfrontend/shared/routes/app_routes.dart';
import 'package:bertucanfrontend/utils/functions.dart';
import 'package:get/get.dart';

class SrhController extends GetxController {
  ISrhRepository repository;

  SrhController({required this.repository});

  var status = RxStatus.empty().obs;
  // var srhs = <Srh>[].obs;

  final _srhs = <Srh>[].obs;
  List<Srh> get srhs => _srhs;
  set srhs(List<Srh> value) {
    _srhs.value = value;
  }

  final srhToShow = <Srh>[].obs;
  List<Srh> get SrhiesToShow => srhToShow;
  set srhToShow(List<Srh> value) {
    srhToShow.value = value;
  }

  var selectedSrh = Srh(id: -1).obs;
  // getSrh() async {
  //   srhToShow = [];
  //   status.value = RxStatus.loading();
  //   await repository.getSrhs().then((data) {
  //     if (data != null) {
  //       srhs.value = data;
  //       status.value = RxStatus.success();
  //     } else {
  //       status.value = RxStatus.error();
  //     }
  //   });

  //   return srhs;
  // }
  Future<void> getSrhs() async {
    status.value = RxStatus.loading();
    srhs = [];
    srhToShow = [];
    await repository.getSrhs().then((data) {
      if (data != null) {
        srhs = data;
        srhToShow = data;
        status.value = RxStatus.success();
      } else {
        status.value = RxStatus.error(translate("no_data"));
      }
    }).catchError((error) {
      status.value = RxStatus.error();
    });
  }

  selectSrh(Srh temp) {
    selectedSrh.value = temp;
    Get.toNamed(Routes.srhDetailPage);
  }

  searchSrhByName(String title) {
    if (title.isNotEmpty) {
      srhToShow = [];
      srhToShow.addAll(srhs.where((srh) =>
          (srh.title ?? "").toLowerCase().contains(title.toLowerCase())));
    } else {
      srhToShow = srhs;
    }
  }
}
