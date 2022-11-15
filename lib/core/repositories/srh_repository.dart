import 'dart:developer';

import 'package:bertucanfrontend/core/enums/common_enums.dart';
import 'package:bertucanfrontend/core/models/freezed_models.dart';
import 'package:bertucanfrontend/core/services/api/api_client.dart';

import '../adapters/srh_adapter.dart';

class SrhRepository implements ISrhRepository {
  ApiClient apiClient;
  SrhRepository({required this.apiClient});

  @override
  Future<List<Srh>> getSrhs() async {
    try {
      var response = await apiClient.request(
        requestType: RequestType.get,
        path: "/articles",
      );
      List<Srh> temp = [];
      response["data"].forEach((data) {
        temp.add(Srh.fromJson(data));
      });
      return temp;
    } catch (e) {
      log("hhhh $e");
      return [];
    }
  }
}
