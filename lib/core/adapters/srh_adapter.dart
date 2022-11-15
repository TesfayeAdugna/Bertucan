import 'package:bertucanfrontend/core/models/freezed_models.dart';
import 'package:bertucanfrontend/core/models/simple_models.dart';

abstract class ISrhRepository {
  Future<List<Srh>?> getSrhs();
}
