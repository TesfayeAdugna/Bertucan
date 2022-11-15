import 'dart:developer';

import 'package:bertucanfrontend/utils/constants.dart';
import 'package:http/http.dart';

class ApiStorageClient {
  Map<String, dynamic> defaultParams = {};

  Future<String?> getImage(String path) async {
    log("Getting data from: ${Uri.parse(
      '$kBaseStorageUrl$path',
    )}");

    Response? response;
    try {
      response = await get(
        Uri.parse(
          '$kBaseStorageUrl$path',
        ),
      );
    } catch (e) {
      showConnectError(e);
    }
    return getStringFromResponse(response);
  }

  void showConnectError(error) {
    // log("could_not_connect_to_the_internet $error");
  }

  String? getStringFromResponse(Response? response) {
    if (response == null) return null;
    if (response.statusCode ~/ 100 == 2) {
      return response.body;
    } else {
      // showConnectError(response.body);
      // showConnectError(response.statusCode);
    }
    return null;
  }
}
