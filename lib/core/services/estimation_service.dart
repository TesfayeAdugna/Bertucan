import 'package:bertucanfrontend/core/models/simple_models.dart';

class EstimationService {
  //get next mensturation date
  MonthlyMensturationModel getNextMensurationDate(
      MonthlyMensturationModel data, UserLogData userLogData) {
    DateTime startDate =
        data.startDate.add(Duration(days: userLogData.daysToStart));
    DateTime endDate = startDate.add(Duration(days: userLogData.daysToEnd));
    DateTime pregnancyDate = endDate.add(Duration(days: 9));
    DateTime phaseChange = endDate.add(Duration(days: 14));
    return MonthlyMensturationModel(
        startDate: startDate,
        endDate: endDate,
        pregnancyDate: pregnancyDate,
        phaseChange: phaseChange);
  }
}
