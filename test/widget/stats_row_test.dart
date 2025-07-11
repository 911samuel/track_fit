import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:track_fit/core/theme/app_colors.dart';
import 'package:track_fit/ui/dashboard/widget/stats_row.dart';

void main() {
  testWidgets('StatsRow renders with calories, steps and sleep info', (
    tester,
  ) async {
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: StatsRow())));
    // WAIT for rendering
    await tester.pumpAndSettle();
    // Check Calories block
    expect(find.text('Calories'), findsOneWidget);
    expect(find.text('730'), findsOneWidget);
    expect(find.text('/kCal'), findsOneWidget);

    // Check Steps block
    expect(find.text('Steps'), findsOneWidget);
    expect(find.text('230'), findsOneWidget);
    expect(find.byIcon(Icons.directions_walk), findsOneWidget);

    // Check Sleep block
    expect(find.text('Sleep'), findsOneWidget);
    expect(find.text('5/8 Hours'), findsOneWidget);

    // Verify circular progress indicators count
    expect(find.byType(CircularProgressIndicator), findsNWidgets(2));

    // Verify circular progress indicator values
    final cpIndicators =
        tester
            .widgetList<CircularProgressIndicator>(
              find.byType(CircularProgressIndicator),
            )
            .toList();

    expect(cpIndicators[0].value, 0.73);
    expect(cpIndicators[0].color, AppColors.darkBackground);

    expect(cpIndicators[1].value, closeTo(5 / 8, 0.001));
    expect(cpIndicators[1].color, AppColors.primaryNeon);
  });
}
