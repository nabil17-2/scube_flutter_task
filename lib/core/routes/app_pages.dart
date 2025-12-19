import 'package:get/get.dart';
import 'package:scube_flutter_task/core/routes/app_routes.dart';

import '../../ modules/dashboard/dashboard_view.dart';
import '../../ modules/data_view/data_view.dart';
import '../../ modules/login/login_view.dart';
import '../../ modules/revenue_view/revenue_view.dart';

class AppPages {
  static final List<GetPage> routes = [
    GetPage(
      name: AppRoutes.login,
      page: () => LoginView(),
    ),
    GetPage(
      name: AppRoutes.dashboard,
      page: () => DashboardView(),
    ),
    GetPage(
      name: AppRoutes.dataView,
      page: () => DataView(),
    ),
    GetPage(
      name: AppRoutes.revenueView,
      page: () => RevenueView(),
    ),
  ];
}