import 'package:bertucanfrontend/core/models/simple_models.dart';

abstract class IHomeRepository {
  void saveCurrentMensturationData(MonthlyMensturationModel data);
  MonthlyMensturationModel? getCurrentMensturationdata();
  List<MonthlyMensturationModel> calculateNextMensturationDates(
      int forMonths, MonthlyMensturationModel data);
  void saveUserLogData(UserLogData data);
  UserLogData getUserLogData();
  List<MonthlyMensturationModel> getForecomingMensturationDates();
  void savePredictedDates(List<MonthlyMensturationModel> data, bool save);
  Future<NormalResponse> loadMensturationCycles({bool save = true});
}
