import 'package:get/get.dart';
import '../../models/data_model.dart';

class DashboardController extends GetxController {
  final currentTime = '9:05'.obs;
  final selectedTab = 0.obs;
  final hasData = true.obs;

  final dashboardData = DashboardData(
    totalPower: 5.53,
    energyPerSqft: '55.00 kWh/Sqft',
    activeData: [
      EnergyData(label: 'Data 1', value: 55505.63, percentage: 29.53, cost: 35689),
      EnergyData(label: 'Data 2', value: 58805.63, percentage: 29.53, cost: 35689),
    ],
    inactiveData: [
      EnergyData(label: 'Data 1', value: 55505.63, percentage: 29.53, cost: 35689),
      EnergyData(label: 'Data 2', value: 58805.63, percentage: 29.53, cost: 35689),
    ],
  ).obs;

  void switchView(bool hasData) {
    this.hasData.value = hasData;
  }

  void navigateToDataView() {
    Get.toNamed('/dataView');
  }

  void navigateToRevenueView() {
    Get.toNamed('/revenueView');
  }
}