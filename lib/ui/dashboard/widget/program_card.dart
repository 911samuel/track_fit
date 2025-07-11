import 'package:flutter/material.dart';
import 'package:track_fit/core/theme/app_colors.dart';
import 'package:track_fit/core/theme/app_dimensions.dart';
import 'package:track_fit/core/theme/app_text_styles.dart';

class ProgramCard extends StatelessWidget {
  const ProgramCard({super.key, required this.imageUrl, required this.title, required this.progress});

  final String imageUrl;
  final String title;
  final double progress;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardGray,
        borderRadius: BorderRadius.circular(AppDimensions.radiusL),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(AppDimensions.radiusL),
            child: Image.network(
              imageUrl,
              height: 80,
              width: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: AppDimensions.spaceM),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyles.h4),
                const SizedBox(height: AppDimensions.spaceS),
                LinearProgressIndicator(
                  value: progress,
                  color: AppColors.primaryNeon,
                  backgroundColor: AppColors.darkBackground,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
