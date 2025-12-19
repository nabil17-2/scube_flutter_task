import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/constants/colors.dart';
import 'registration_controller.dart';

class RegistrationView extends StatelessWidget {
  final RegistrationController controller = Get.put(RegistrationController());

  RegistrationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Background Blue Circle
          Positioned(
            top: -100,
            right: -100,
            child: Container(
              width: 300,
              height: 300,
              decoration: const BoxDecoration(
                color: AppColors.lightBlue,
                shape: BoxShape.circle,
              ),
            ),
          ),

          Positioned(
            bottom: -150,
            left: -150,
            child: Container(
              width: 400,
              height: 400,
              decoration: const BoxDecoration(
                color: AppColors.lightBlue,
                shape: BoxShape.circle,
              ),
            ),
          ),

          // Content
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Top Spacing
                  const SizedBox(height: 40),

                  // Back Button
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      onPressed: controller.goToLogin,
                      icon: const Icon(
                        Icons.arrow_back,
                        color: AppColors.primaryBlue,
                        size: 28,
                      ),
                    ),
                  ),

                  // SCUBE Logo
                  Text(
                    'SCUBE',
                    style: GoogleFonts.montserrat(
                      fontSize: 48,
                      fontWeight: FontWeight.w900,
                      color: AppColors.primaryBlue,
                      letterSpacing: 2,
                    ),
                  ),

                  const SizedBox(height: 8),

                  // Subtitle
                  Text(
                    'Create New Account',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textMedium,
                    ),
                  ),

                  const SizedBox(height: 40),

                  // Registration Form
                  Column(
                    children: [
                      // Full Name Field
                      _buildTextField(
                        label: 'Full Name',
                        hint: 'Enter your full name',
                        icon: Icons.person_outline,
                        onChanged: controller.setFullName,
                      ),

                      const SizedBox(height: 20),

                      // Email Field
                      _buildTextField(
                        label: 'Email Address',
                        hint: 'Enter your email',
                        icon: Icons.email_outlined,
                        keyboardType: TextInputType.emailAddress,
                        onChanged: controller.setEmail,
                      ),

                      const SizedBox(height: 20),

                      // Password Field
                      Obx(() => _buildPasswordField(
                        label: 'Password',
                        hint: 'Enter your password',
                        isVisible: controller.isPasswordVisible.value,
                        onToggleVisibility: controller.togglePasswordVisibility,
                        onChanged: controller.setPassword,
                      )),

                      const SizedBox(height: 20),

                      // Confirm Password Field
                      Obx(() => _buildPasswordField(
                        label: 'Confirm Password',
                        hint: 'Confirm your password',
                        isVisible: controller.isConfirmPasswordVisible.value,
                        onToggleVisibility: controller.toggleConfirmPasswordVisibility,
                        onChanged: controller.setConfirmPassword,
                      )),

                      // Error Message
                      Obx(() => controller.errorMessage.value.isNotEmpty
                          ? Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Text(
                          controller.errorMessage.value,
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            color: Colors.red,
                          ),
                        ),
                      )
                          : const SizedBox.shrink()),

                      const SizedBox(height: 30),

                      // Register Button
                      Obx(() => Container(
                        height: 56,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              AppColors.primaryBlue,
                              const Color(0xFF0052B4)
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(28),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.primaryBlue.withOpacity(0.3),
                              blurRadius: 15,
                              spreadRadius: 0,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(28),
                            onTap: controller.isLoading.value ? null : controller.register,
                            child: Center(
                              child: controller.isLoading.value
                                  ? const SizedBox(
                                width: 24,
                                height: 24,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  valueColor: AlwaysStoppedAnimation(Colors.white),
                                ),
                              )
                                  : Text(
                                'Create Account',
                                style: GoogleFonts.inter(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  letterSpacing: 1,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )),

                      const SizedBox(height: 20),

                      // Login Link
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account? ',
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              color: AppColors.textMedium,
                            ),
                          ),
                          GestureDetector(
                            onTap: controller.goToLogin,
                            child: Text(
                              'Sign In',
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: AppColors.primaryBlue,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  // Bottom spacing
                  const SizedBox(height: 60),
                ],
              ),
            ),
          ),

          // Registration Title at top
          Positioned(
            top: 60,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                'Registration',
                style: GoogleFonts.inter(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textDark,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required String hint,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    required Function(String) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.textDark,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.borderColor),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Icon(
                  icon,
                  color: AppColors.primaryBlue,
                  size: 20,
                ),
              ),
              Expanded(
                child: TextField(
                  onChanged: onChanged,
                  keyboardType: keyboardType,
                  decoration: InputDecoration(
                    hintText: hint,
                    border: InputBorder.none,
                    hintStyle: GoogleFonts.inter(
                      color: AppColors.textLight,
                    ),
                  ),
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    color: AppColors.textDark,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordField({
    required String label,
    required String hint,
    required bool isVisible,
    required VoidCallback onToggleVisibility,
    required Function(String) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.textDark,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.borderColor),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Icon(
                  Icons.lock_outline,
                  color: AppColors.primaryBlue,
                  size: 20,
                ),
              ),
              Expanded(
                child: TextField(
                  onChanged: onChanged,
                  obscureText: !isVisible,
                  decoration: InputDecoration(
                    hintText: hint,
                    border: InputBorder.none,
                    hintStyle: GoogleFonts.inter(
                      color: AppColors.textLight,
                    ),
                  ),
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    color: AppColors.textDark,
                  ),
                ),
              ),
              IconButton(
                onPressed: onToggleVisibility,
                icon: Icon(
                  isVisible ? Icons.visibility : Icons.visibility_off,
                  color: AppColors.textLight,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
