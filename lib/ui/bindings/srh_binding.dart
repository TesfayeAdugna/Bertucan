import 'package:bertucanfrontend/core/adapters/srh_adapter.dart';
import 'package:bertucanfrontend/core/repositories/srh_repository.dart';
import 'package:bertucanfrontend/ui/controllers/srh_controller.dart';
import 'package:get/get.dart';

class SrhBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<ISrhRepository>(SrhRepository(apiClient: Get.find()));
    Get.lazyPut<SrhController>(() => SrhController(repository:Get.find()));
  }
}
