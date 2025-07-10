import 'package:flutter/material.dart';

import '../../../core/theme/app_text_styles.dart';
import '../../../core/theme/app_dimensions.dart';

class AuthHeader extends StatelessWidget {
  final VoidCallback onBackTap;
  const AuthHeader({required this.onBackTap, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: AppDimensions.marginXS),
        Text("Fitness Tracker", style: AppTextStyles.brand),
      ],
    );
  }
}
