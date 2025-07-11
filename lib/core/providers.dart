import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:track_fit/ui/dashboard/view_model/workout.dart';

final workoutTimerProvider =
    StateNotifierProvider<WorkoutTimerNotifier, WorkoutTimerState>(
      (ref) => WorkoutTimerNotifier(weight: 70, met: 8), // Example values
    );
