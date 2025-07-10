import 'package:flutter/material.dart';
import 'package:track_fit/core/theme/app_colors.dart';
import 'package:track_fit/core/theme/app_text_styles.dart';
import 'package:track_fit/core/theme/app_dimensions.dart';
import '../../onboarding/view_model/onboarding_view_model.dart';

class OnboardingTopBar extends StatelessWidget {
  final OnboardingState state;
  final OnboardingViewModel viewModel;

  const OnboardingTopBar({
    super.key,
    required this.state,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDimensions.paddingL),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (state.currentPage > 0)
            GestureDetector(
              onTap: viewModel.previousPage,
              child: Container(
                padding: const EdgeInsets.all(AppDimensions.paddingS),
                decoration: BoxDecoration(
                  color: AppColors.cardGray,
                  borderRadius: BorderRadius.circular(AppDimensions.radiusM),
                ),
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.textWhite,
                  size: AppDimensions.iconS,
                ),
              ),
            )
          else
            const SizedBox(width: 40),
          Text("Fitness Tracker", style: AppTextStyles.brand),
          if (!state.isLastPage)
            GestureDetector(
              onTap: viewModel.skipToEnd,
              child: Text("Skip", style: AppTextStyles.navigation),
            )
          else
            const SizedBox(width: 40),
        ],
      ),
    );
  }
}
