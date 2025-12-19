import 'package:get/get.dart';
import '../../core/routes/app_routes.dart';

class LoginController extends GetxController {
  final username = ''.obs;
  final password = ''.obs;
  final isLoading = false.obs;

  void login() {
    isLoading.value = true;

    // Simulate API call
    Future.delayed(Duration(seconds: 2), () {
      isLoading.value = false;
      Get.offAllNamed(AppRoutes.dashboard);
    });
  }

  void setUsername(String value) {
    username.value = value;
  }

  void setPassword(String value) {
    password.value = value;
  }
}