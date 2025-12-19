import 'package:get/get.dart';

class RevenueViewController extends GetxController {
  final currentTime = '9:05'.obs;

  final revenueData = <Map<String, String>>[
    {'value': '2798.50', 'percentage': '28.53%', 'cost': '35688'},
    {'value': '2798.50', 'percentage': '28.53%', 'cost': '35688'},
    {'value': '2798.50', 'percentage': '28.53%', 'cost': '35688'},
    {'value': '2798.50', 'percentage': '28.53%', 'cost': '35688'},
  ].obs;
}