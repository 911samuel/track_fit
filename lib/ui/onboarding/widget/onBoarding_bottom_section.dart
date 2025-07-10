import 'package:flutter/material.dart';
import 'package:track_fit/core/theme/app_colors.dart';
import 'package:track_fit/core/theme/app_text_styles.dart';
import 'package:track_fit/core/theme/app_dimensions.dart';
import 'package:track_fit/ui/auth/view/auth_screen.dart';
import '../../onboarding/view_model/onboarding_view_model.dart';

class OnboardingBottomSection extends StatelessWidget {
  final OnboardingState state;
  final OnboardingViewModel viewModel;

  const OnboardingBottomSection({
    super.key,
    required this.state,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDimensions.paddingL),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              OnboardingViewModel.slides.length,
              (index) => AnimatedContainer(
                duration: Duration(milliseconds: AppDimensions.animationNormal),
                width:
                    index == state.currentPage
                        ? AppDimensions.dotIndicatorActiveWidth
                        : AppDimensions.dotIndicatorSize,
                height: AppDimensions.dotIndicatorSize,
                margin: const EdgeInsets.symmetric(
                  horizontal: AppDimensions.marginXS,
                ),
                decoration: BoxDecoration(
                  color:
                      index == state.currentPage
                          ? AppColors.primaryNeon
                          : AppColors.cardGray,
                  borderRadius: BorderRadius.circular(AppDimensions.radiusXS),
                ),
              ),
            ),
          ),
          const SizedBox(height: AppDimensions.spaceXL - AppDimensions.spaceXS),
          SizedBox(
            width: double.infinity,
            height: AppDimensions.buttonHeightLarge,
            child: ElevatedButton(
              onPressed: () {
                if (state.isLastPage) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const AuthScreen()),
                  );
                } else {
                  viewModel.nextPage();
                }
              },
              child: Text(
                state.isLastPage ? "Get Started" : "Continue",
                style: AppTextStyles.buttonLarge,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
