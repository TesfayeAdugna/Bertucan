import 'dart:developer';

import 'package:bertucanfrontend/core/adapters/gbv_adapters.dart';
import 'package:bertucanfrontend/core/enums/common_enums.dart';
import 'package:bertucanfrontend/core/models/freezed_models.dart';
import 'package:bertucanfrontend/core/models/simple_models.dart';
import 'package:bertucanfrontend/core/services/api/api_client.dart';

class GbvRepository implements IGbvRepository {
  final ApiClient apiClient;
  GbvRepository({required this.apiClient});

  @override
  Future<List<Gbv>?> getGbvies() async {
    var response = await apiClient.request(
      requestType: RequestType.get,
      path: '/gbvcenters',
    );
    if (response["data"] != null) {
      List<Gbv> gbvies = [];
      for (var gbv in response["data"]) {
        gbvies.add(Gbv.fromJson(gbv));
      }
      log(gbvies.length.toString());
      return gbvies;
    }
    return null;
  }

  @override
  Future<NormalResponse> reportGbv(GbvReport reportPayload) async {
    Map<String, dynamic> extra = {};
    extra = reportPayload.toJson();
    extra.removeWhere((key, value) => key == 'file');
    var response = await apiClient.sendFormData(
        fileFieldName: 'file', formPayload: extra, endPoint: '/reports');
    print(response);
    if (response["success"]) {
      return NormalResponse(
        success: true,
      );
    } else {
      return NormalResponse(
        success: false,
      );
    }
    return NormalResponse(success: false);
  }
}
