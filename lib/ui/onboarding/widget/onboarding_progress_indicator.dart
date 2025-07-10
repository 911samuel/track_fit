import 'package:flutter/material.dart';
import 'package:track_fit/core/theme/app_colors.dart';
import 'package:track_fit/core/theme/app_dimensions.dart';
import '../../onboarding/view_model/onboarding_view_model.dart';

class OnboardingProgressIndicator extends StatelessWidget {
  final OnboardingState state;

  const OnboardingProgressIndicator({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimensions.paddingL),
      child: Row(
        children: List.generate(
          OnboardingViewModel.slides.length,
          (index) => Expanded(
            child: AnimatedContainer(
              duration: Duration(milliseconds: AppDimensions.animationNormal),
              height: AppDimensions.progressIndicatorHeight,
              margin: const EdgeInsets.symmetric(
                horizontal: AppDimensions.marginXS / 2,
              ),
              decoration: BoxDecoration(
                color:
                    index <= state.currentPage
                        ? AppColors.primaryNeon
                        : AppColors.cardGray,
                borderRadius: BorderRadius.circular(AppDimensions.radiusXS / 2),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
