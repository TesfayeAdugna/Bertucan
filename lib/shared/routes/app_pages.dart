import 'package:bertucanfrontend/shared/routes/app_routes.dart';
import 'package:bertucanfrontend/ui/bindings/gbv_bindings.dart';
import 'package:bertucanfrontend/ui/bindings/srh_binding.dart';
import 'package:bertucanfrontend/ui/pages/auth/lock_screen_page.dart';
import 'package:bertucanfrontend/ui/pages/auth/login_page.dart';
import 'package:bertucanfrontend/ui/pages/auth/signup_page.dart';
import 'package:bertucanfrontend/ui/pages/gbv/gbv_detail_page.dart';
import 'package:bertucanfrontend/ui/pages/gbv/gbv_location_page.dart';
import 'package:bertucanfrontend/ui/pages/gbv/report_gbv_page.dart';
import 'package:bertucanfrontend/ui/pages/home_page.dart';
import 'package:bertucanfrontend/ui/pages/intro/into_page.dart';
import 'package:bertucanfrontend/ui/pages/intro/questionnaire_page.dart';
import 'package:bertucanfrontend/ui/pages/log/calendar/calendar.dart';
import 'package:bertucanfrontend/ui/pages/log/chances_of_pregnancy_page.dart';
import 'package:bertucanfrontend/ui/pages/log/cycles_history_page.dart';
import 'package:bertucanfrontend/ui/pages/log/daily_detail_page.dart';
import 'package:bertucanfrontend/ui/pages/log/log_page.dart';
import 'package:bertucanfrontend/ui/pages/log/symptoms_page.dart';
import 'package:bertucanfrontend/ui/pages/notification/notifications_page.dart';
import 'package:bertucanfrontend/ui/pages/srh/srh_detail_page.dart';
import 'package:get/get.dart';

abstract class AppPages {
  static final pages = [
    //auth
    GetPage(
      name: Routes.signupPage,
      page: () => SignUpPage(),
    ),
    GetPage(
      name: Routes.loginPage,
      page: () => LoginPage(),
    ),

    //main
    GetPage(
        name: Routes.homePage,
        page: () => const HomePage(),
        bindings: [GbvBinding(), SrhBinding()]),
    GetPage(
      name: Routes.questionnairePage,
      page: () => QuestionnairePage(),
    ),
    GetPage(
      name: Routes.introPage,
      page: () => IntroPage(),
    ),
    GetPage(
      name: Routes.notificationPage,
      page: () => const NotificationsPage(),
    ),
    GetPage(
      name: Routes.gbvDetailPage,
      page: () => const GbvDetailPage(),
    ),
    GetPage(
      name: Routes.reportGbvPage,
      page: () => ReportGbvPage(),
    ),
    GetPage(
      name: Routes.logChancePregnancyPage,
      page: () => const ChancesOfPregnancy(),
    ),
    GetPage(
      name: Routes.symptomsPage,
      page: () => const SymptomsPage(),
    ),
    GetPage(
      name: Routes.srhDetailPage,
      page: () => SrhDetailPage(),
    ),
    GetPage(
      name: Routes.dailyDetailPage,
      page: () => const DailyDetailPage(),
    ),
    GetPage(
      name: Routes.ethioCalendar, 
      page: () => EthioCalendar(),
    ),
    GetPage(
      name: Routes.logPage,
      page: () => LogPage(),
    ),
    GetPage(
      name: Routes.gbvLocationPage,
      page: () => const GbvLocationPage(),
    ),
    GetPage(
      name: Routes.lockScreenPage,
      page: () => const LockScreenPage(),
    ),
    GetPage(
      name: Routes.cyclesHistoryPage,
      page: () => CyclesHistoryPage(),
    ),
  ];
}
