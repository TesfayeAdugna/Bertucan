import 'package:bertucanfrontend/core/adapters/gbv_adapters.dart';
import 'package:bertucanfrontend/core/repositories/gbv_repositories.dart';
import 'package:bertucanfrontend/ui/controllers/gbv_controller.dart';
import 'package:get/get.dart';

class GbvBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<IGbvRepository>(GbvRepository(apiClient: Get.find()));
    Get.lazyPut<GbvController>(() => GbvController(Get.find()));
  }
}
