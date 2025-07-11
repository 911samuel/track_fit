import 'package:flutter/material.dart';
import 'package:track_fit/ui/dashboard/widget/program_icon.dart';

class ProgramIcons extends StatelessWidget {
  const ProgramIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          ProgramIcon(icon: Icons.directions_run, label: 'Jog'),
          ProgramIcon(icon: Icons.self_improvement, label: 'Yoga'),
          ProgramIcon(icon: Icons.directions_bike, label: 'Cycling'),
          ProgramIcon(icon: Icons.fitness_center, label: 'Workout'),
        ],
      ),
    );
  }
}
