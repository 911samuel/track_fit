import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/theme/app_dimensions.dart';
import '../view_model/auth_view_model.dart';

class AuthSubmitButton extends StatelessWidget {
  final AuthViewModel vm;
  const AuthSubmitButton({super.key, required this.vm});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: AppDimensions.buttonHeightLarge,
      child: ElevatedButton(
        onPressed: vm.isLoading ? null : () => vm.submitForm(context),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryNeon,
          foregroundColor: AppColors.darkBackground,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimensions.radiusM),
          ),
          elevation: 0,
        ),
        child:
            vm.isLoading
                ? const CircularProgressIndicator(
                  color: AppColors.darkBackground,
                )
                : Text(
                  vm.isLoginMode ? "Sign In" : "Create Account",
                  style: AppTextStyles.buttonLarge,
                ),
      ),
    );
  }
}
