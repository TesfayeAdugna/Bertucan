import 'package:bertucanfrontend/core/models/freezed_models.dart';
import 'package:bertucanfrontend/core/models/simple_models.dart';

abstract class IGbvRepository {
  Future<List<Gbv>?> getGbvies();
  Future<NormalResponse> reportGbv(GbvReport reportPayload);
}
