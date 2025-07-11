import 'package:flutter_test/flutter_test.dart';

import 'package:track_fit/ui/dashboard/view_model/dashboard.dart';

void main() {
  group('WorkoutTimerNotifier Tests', () {
    late WorkoutTimerNotifier notifier;

    setUp(() {
      notifier = WorkoutTimerNotifier(weight: 70, met: 8.0);
    });

    tearDown(() {
      notifier.dispose();
    });

    test('Initial state is correct', () {
      expect(notifier.state.seconds, 0);
      expect(notifier.state.calories, 0);
      expect(notifier.state.isRunning, false);
    });

    test('Start timer updates seconds and calories', () async {
      notifier.start();
      expect(notifier.state.isRunning, true);

      // Wait for 3 seconds to allow timer ticks
      await Future.delayed(Duration(seconds: 3));

      // After 3 seconds
      expect(notifier.state.seconds, greaterThanOrEqualTo(3));
      expect(notifier.state.calories, greaterThan(0));

      notifier.pause();
      expect(notifier.state.isRunning, false);
    });

    test('Pause stops timer', () async {
      notifier.start();
      await Future.delayed(Duration(seconds: 2));
      notifier.pause();

      final pausedSeconds = notifier.state.seconds;
      final pausedCalories = notifier.state.calories;

      // Wait to check no further increments after pause
      await Future.delayed(Duration(seconds: 2));

      expect(notifier.state.seconds, pausedSeconds);
      expect(notifier.state.calories, pausedCalories);
      expect(notifier.state.isRunning, false);
    });

    test('Reset stops timer and clears state', () async {
      notifier.start();
      await Future.delayed(Duration(seconds: 2));
      notifier.reset();

      expect(notifier.state.seconds, 0);
      expect(notifier.state.calories, 0);
      expect(notifier.state.isRunning, false);
    });

    test('Calorie calculation is correct', () {
      // 1 minute (60 seconds) example:
      final calories = notifier.calculateCalories(60);
      // calories = 1 * weight * met * 0.0175
      final expectedCalories = 1 * 70 * 8.0 * 0.0175;
      expect(calories, closeTo(expectedCalories, 0.0001));
    });
  });
}
