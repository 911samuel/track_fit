import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/theme/app_dimensions.dart';
import '../view_model/auth_view_model.dart';

class AuthWelcomeSection extends StatelessWidget {
  final AuthViewModel vm;

  const AuthWelcomeSection({super.key, required this.vm});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: vm.flipAnimation,
      builder: (_, __) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TweenAnimationBuilder<double>(
              tween: Tween(begin: 0.0, end: 1.0),
              duration: const Duration(
                milliseconds: AppDimensions.animationVerySlow,
              ),
              builder:
                  (context, value, _) => Transform.scale(
                    scale: value,
                    child: Container(
                      width: AppDimensions.onboardingIconSize * 0.8,
                      height: AppDimensions.onboardingIconSize * 0.8,
                      decoration: BoxDecoration(
                        color: AppColors.cardGray,
                        borderRadius: BorderRadius.circular(
                          AppDimensions.onboardingIconRadius,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.primaryNeon.withValues(alpha: 0.3),
                            blurRadius: 20,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                      child: Icon(
                        vm.isLoginMode ? Icons.login : Icons.person_add,
                        size: AppDimensions.iconXL - AppDimensions.iconXS,
                        color: AppColors.primaryNeon,
                      ),
                    ),
                  ),
            ),
            const SizedBox(height: AppDimensions.spaceL),
            Text(
              vm.isLoginMode ? "Welcome Back!" : "Create Account",
              style: AppTextStyles.onboardingTitle,
            ),
            const SizedBox(height: AppDimensions.spaceS),
            Text(
              vm.isLoginMode
                  ? "Sign in to continue your fitness journey"
                  : "Join us and start your fitness transformation",
              style: AppTextStyles.onboardingDescription,
            ),
          ],
        );
      },
    );
  }
}
