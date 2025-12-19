import 'package:get/get.dart';

import '../../models/data_model.dart';

class DataViewController extends GetxController {
  final currentTime = '9:05'.obs;

  final energyData = <EnergyData>[
    EnergyData(label: 'Data A', value: 2798.50, percentage: 29.53, cost: 35689),
    EnergyData(label: 'Data B', value: 72598.50, percentage: 35.39, cost: 5259689),
    EnergyData(label: 'Data C', value: 6598.36, percentage: 83.90, cost: 5698756),
    EnergyData(label: 'Data D', value: 6598.26, percentage: 36.59, cost: 356987),
  ].obs;
}