import 'package:flutter/material.dart';
import 'package:track_fit/core/theme/app_dimensions.dart';
import 'package:track_fit/ui/dashboard/widget/program_card.dart';

class ProgramList extends StatelessWidget {
  const ProgramList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProgramCard(
          title: 'Morning Routine',
          imageUrl: 'https://picsum.photos/200/300',
          progress: 0.3,
        ),
        const SizedBox(height: AppDimensions.spaceM),
        ProgramCard(title: 'Cardio Run', imageUrl: 'https://picsum.photos/200/301', progress: 0.6),
      ],
    );
  }
}