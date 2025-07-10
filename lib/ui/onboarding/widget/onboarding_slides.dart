import 'package:flutter/material.dart';
import 'package:track_fit/core/theme/app_colors.dart';
import 'package:track_fit/core/theme/app_text_styles.dart';
import 'package:track_fit/core/theme/app_dimensions.dart';
import 'package:track_fit/ui/onboarding/view_model/onboarding_view_model.dart';

class OnboardingSlides extends StatelessWidget {
  final OnboardingSlide slide;
  final int index;
  final Animation<double> fadeAnimation;
  final Animation<Offset> slideAnimation;

  const OnboardingSlides({
    super.key,
    required this.slide,
    required this.index,
    required this.fadeAnimation,
    required this.slideAnimation,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: fadeAnimation,
      builder: (context, child) {
        return SlideTransition(
          position: slideAnimation,
          child: FadeTransition(
            opacity: fadeAnimation,
            child: Padding(
              padding: const EdgeInsets.all(AppDimensions.paddingL),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildIcon(slide),
                  const SizedBox(
                    height: AppDimensions.spaceXXL + AppDimensions.spaceS,
                  ),
                  _buildTitle(slide),
                  const SizedBox(height: AppDimensions.spaceL),
                  _buildDescription(slide),
                  const SizedBox(
                    height: AppDimensions.spaceXXL + AppDimensions.spaceS,
                  ),
                  _buildFeatures(slide),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildIcon(OnboardingSlide slide) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: Duration(milliseconds: AppDimensions.animationVerySlow),
      builder: (context, value, child) {
        return Transform.scale(
          scale: value,
          child: Container(
            width: AppDimensions.onboardingIconSize,
            height: AppDimensions.onboardingIconSize,
            decoration: BoxDecoration(
              color: AppColors.cardGray,
              borderRadius: BorderRadius.circular(
                AppDimensions.onboardingIconRadius,
              ),
              boxShadow: [
                BoxShadow(
                  color: slide.iconColor.withValues(alpha: 0.3),
                  blurRadius: 20,
                  spreadRadius: 5,
                ),
              ],
            ),
            child: Icon(
              slide.icon,
              size: AppDimensions.iconXXL - AppDimensions.iconXS,
              color: slide.iconColor,
            ),
          ),
        );
      },
    );
  }

  Widget _buildTitle(OnboardingSlide slide) {
    return Column(
      children: [
        Text(
          slide.title,
          style: AppTextStyles.onboardingTitle,
          textAlign: TextAlign.center,
        ),
        Text(
          slide.subtitle,
          style: AppTextStyles.onboardingTitleBold,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildDescription(OnboardingSlide slide) {
    return Text(
      slide.description,
      style: AppTextStyles.onboardingDescription,
      textAlign: TextAlign.center,
    );
  }

  Widget _buildFeatures(OnboardingSlide slide) {
    return Column(
      children:
          slide.features.map((feature) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                vertical: AppDimensions.paddingS,
              ),
              child: Row(
                children: [
                  Container(
                    width: AppDimensions.dotIndicatorSize,
                    height: AppDimensions.dotIndicatorSize,
                    decoration: BoxDecoration(
                      color: AppColors.accentGreen,
                      borderRadius: BorderRadius.circular(
                        AppDimensions.radiusXS,
                      ),
                    ),
                  ),
                  const SizedBox(width: AppDimensions.spaceM),
                  Text(feature, style: AppTextStyles.onboardingFeature),
                ],
              ),
            );
          }).toList(),
    );
  }
}
