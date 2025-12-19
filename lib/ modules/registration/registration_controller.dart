import 'package:get/get.dart';
import '../../core/routes/app_routes.dart';
import '../../models/user_model.dart';

class RegistrationController extends GetxController {
  // Form fields
  final fullName = ''.obs;
  final email = ''.obs;
  final password = ''.obs;
  final confirmPassword = ''.obs;
  final isPasswordVisible = false.obs;
  final isConfirmPasswordVisible = false.obs;
  final isLoading = false.obs;
  final errorMessage = ''.obs;

  // Form validation
  bool get isFormValid {
    return fullName.value.isNotEmpty &&
        email.value.isNotEmpty &&
        password.value.isNotEmpty &&
        confirmPassword.value.isNotEmpty &&
        password.value == confirmPassword.value;
  }

  // Email validation
  bool get isEmailValid {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email.value);
  }

  // Password validation
  bool get isPasswordValid => password.value.length >= 6;

  // Update methods
  void setFullName(String value) => fullName.value = value;
  void setEmail(String value) => email.value = value;
  void setPassword(String value) => password.value = value;
  void setConfirmPassword(String value) => confirmPassword.value = value;
  void togglePasswordVisibility() => isPasswordVisible.value = !isPasswordVisible.value;
  void toggleConfirmPasswordVisibility() => isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;

  // Register user
  Future<void> register() async {
    if (!isFormValid) {
      errorMessage.value = 'Please fill all fields correctly';
      return;
    }

    if (!isEmailValid) {
      errorMessage.value = 'Please enter a valid email address';
      return;
    }

    if (!isPasswordValid) {
      errorMessage.value = 'Password must be at least 6 characters';
      return;
    }

    if (password.value != confirmPassword.value) {
      errorMessage.value = 'Passwords do not match';
      return;
    }

    isLoading.value = true;
    errorMessage.value = '';

    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));

    // Create user object
    final user = User(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: fullName.value,
      email: email.value,
      password: password.value, // In real app, hash this password
      createdAt: DateTime.now(),
    );

    // Store user locally (simulate)
    Get.offAllNamed(AppRoutes.login, arguments: {
      'registeredEmail': email.value,
      'message': 'Registration successful! Please login.'
    });

    isLoading.value = false;
  }

  void goToLogin() {
    Get.offAllNamed(AppRoutes.login);
  }
}