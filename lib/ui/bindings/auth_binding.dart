import 'package:bertucanfrontend/core/adapters/auth_adapter.dart';
import 'package:bertucanfrontend/core/adapters/home_adapter.dart';
import 'package:bertucanfrontend/core/repositories/auth_repository.dart';
import 'package:bertucanfrontend/core/repositories/home_repository.dart';
import 'package:bertucanfrontend/core/services/api/api_client.dart';
import 'package:bertucanfrontend/core/services/api_storage_service.dart';
import 'package:bertucanfrontend/core/services/estimation_service.dart';
import 'package:bertucanfrontend/core/services/notification_service.dart';
import 'package:bertucanfrontend/ui/controllers/auth_controller.dart';
import 'package:bertucanfrontend/ui/controllers/home_controller.dart';
import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class AuthBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Dio(), fenix: true);
    Get.lazyPut(() => Connectivity(), fenix: true);
    Get.lazyPut(() => ApiClient(dio: Get.find(), connectivity: Get.find()),
        fenix: true);
    Get.put<IAuthRepository>(AuthRepository(apiClient: Get.find()));
    Get.put<AuthController>(AuthController(Get.find()));

    Get.lazyPut(() => EstimationService(), fenix: true);
    Get.lazyPut(() => NotificationService(), fenix: true);
    Get.put<IHomeRepository>(HomeRepository(
        service: Get.find(),
        apiClient: Get.find(),
        notificationService: Get.find()));
    Get.put<HomeController>(HomeController(Get.find()));
    Get.lazyPut(() => ApiStorageClient(), fenix: true);
  }
}
