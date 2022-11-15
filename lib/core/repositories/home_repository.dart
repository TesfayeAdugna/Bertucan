import 'dart:developer';

import 'package:bertucanfrontend/core/adapters/home_adapter.dart';
import 'package:bertucanfrontend/core/enums/common_enums.dart';
import 'package:bertucanfrontend/core/models/simple_models.dart';
import 'package:bertucanfrontend/core/services/api/api_client.dart';
import 'package:bertucanfrontend/core/services/estimation_service.dart';
import 'package:bertucanfrontend/core/services/notification_service.dart';
import 'package:bertucanfrontend/utils/functions.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeRepository implements IHomeRepository {
  GetStorage storage = GetStorage();
  EstimationService service;
  ApiClient apiClient;
  NotificationService notificationService;
  HomeRepository(
      {required this.service,
      required this.apiClient,
      required this.notificationService});

  @override
  List<MonthlyMensturationModel> calculateNextMensturationDates(
      int forMonths, MonthlyMensturationModel data) {
    List<MonthlyMensturationModel> predictions = [];
    MonthlyMensturationModel calculateFrom = data;
    UserLogData userLogData = getUserLogData();
    predictions.add(calculateFrom);
    for (int i = 0; i < forMonths; i++) {
      var temp = service.getNextMensurationDate(calculateFrom, userLogData);
      predictions.add(temp);
      try {
        showPeriodNotification(temp.startDate.subtract(Duration(days: 2)), i);
      } catch (e) {
        log(e.toString());
      }
      calculateFrom = temp;
    }
    savePredictedDates(predictions, true);
    MonthlyMensturationModel currentMonth = predictions.firstWhere(
        (element) => element.startDate.month == DateTime.now().month);
    saveCurrentMensturationData(currentMonth);
    return predictions;
  }

  showPeriodNotification(DateTime forDate, int id) {
    Duration showAfter = forDate.difference(DateTime.now());

    notificationService.scheduledNotification(
        translate("period_alert"),
        "${translate('your_period_starts_in')} ${showAfter.inDays.abs()} ${translate('days')}",
        showAfter,
        id);
  }

  @override
  void saveCurrentMensturationData(MonthlyMensturationModel data) {
    storage.write('current_mensturation_data', data.toJson());
  }

  @override
  MonthlyMensturationModel? getCurrentMensturationdata() {
    return MonthlyMensturationModel.fromJson(
        storage.read('current_mensturation_data'));
  }

  @override
  UserLogData getUserLogData() {
    return UserLogData.fromJson(storage.read('user_log_data'));
  }

  @override
  void saveUserLogData(UserLogData data) {
    storage.write('user_log_data', data.toJson());
  }

  @override
  List<MonthlyMensturationModel> getForecomingMensturationDates() {
    if (storage.hasData('forecoming_mensturation_data')) {
      List<MonthlyMensturationModel> predictions = [];
      storage.read('forecoming_mensturation_data').forEach((element) {
        if (element is MonthlyMensturationModel) {
          predictions.add(element);
        } else {
          predictions.add(MonthlyMensturationModel.fromJson(element));
        }
      });
      return predictions;
    }
    return [];
  }

  @override
  Future<NormalResponse> loadMensturationCycles({bool save = true}) async {
    try {
      if (storage.hasData('token')) {
        List<MonthlyMensturationModel> predictions = [];
        final response = await apiClient.request(
          requestType: RequestType.get,
          path: '/logInfos',
        );
        if (response['success']) {
          response['data'].forEach((element) {
            predictions.add(MonthlyMensturationModel.fromJson(element));
          });
          savePredictedDates(predictions, save);
          return NormalResponse(success: true);
        } else {
          return NormalResponse(success: false);
        }
      }
      return NormalResponse(success: false);
    } catch (e) {
      return NormalResponse(success: false);
    }
  }

  @override
  Future<void> savePredictedDates(
      List<MonthlyMensturationModel> data, bool save) async {
    storage.write('forecoming_mensturation_data', data);
    saveUserLogData(UserLogData(
        startDate: data[0].startDate,
        endDate: data[0].endDate,
        daysToStart:
            data[1].startDate.difference(data[0].startDate).inDays.abs(),
        daysToEnd: data[0].endDate.difference(data[0].startDate).inDays.abs()));
    try {
      if (storage.hasData('token') && save) {
        var temp = [];
        for (var element in data) {
          temp.add(element.toJson());
        }
        final response = await apiClient.request(
            requestType: RequestType.post,
            path: '/logInfos',
            data: {'log_infos': temp});
        if (response['success']) {
          toast('info', 'log_data_uploaded');
        }
      }
    } catch (e) {
      log('hhh$e');
    }
  }
}
