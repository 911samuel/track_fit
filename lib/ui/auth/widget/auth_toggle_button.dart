import 'package:flutter/material.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/theme/app_colors.dart';
import '../view_model/auth_view_model.dart';

class AuthToggleButton extends StatelessWidget {
  final AuthViewModel vm;

  const AuthToggleButton({super.key, required this.vm});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          vm.isLoginMode
              ? "Don't have an account? "
              : "Already have an account? ",
          style: AppTextStyles.onboardingDescription,
        ),
        GestureDetector(
          onTap: vm.toggleAuthMode,
          child: Text(
            vm.isLoginMode ? "Sign Up" : "Sign In",
            style: AppTextStyles.onboardingFeature.copyWith(
              color: AppColors.primaryNeon,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
