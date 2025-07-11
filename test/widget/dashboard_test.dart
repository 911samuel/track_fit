import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:track_fit/ui/dashboard/view/dashboard_screen.dart';
import 'package:track_fit/ui/dashboard/widget/program_icons.dart';
import 'package:track_fit/ui/dashboard/widget/program_list.dart';
import 'package:track_fit/ui/dashboard/widget/stats_row.dart';
import 'package:track_fit/ui/dashboard/widget/work_progress.dart';

void main() {
  testWidgets('DashboardScreen renders correctly with expected widgets', (
    WidgetTester tester,
  ) async {
    await mockNetworkImagesFor(() async {
      await tester.pumpWidget(
        ProviderScope(child: MaterialApp(home: DashboardScreen())),
      );

      // Verify AppBar elements
      expect(find.byType(CircleAvatar), findsOneWidget);
      expect(find.text('Welcome Back!!!'), findsOneWidget);
      expect(find.text('Mr.Fugazi'), findsOneWidget);
      expect(find.byIcon(Icons.emoji_events), findsOneWidget);
      expect(find.byIcon(Icons.notifications), findsOneWidget);

      // Verify main content widgets
      expect(find.byType(WorkProgress), findsOneWidget);
      expect(find.byType(StatsRow), findsOneWidget);
      expect(find.text('Programs'), findsOneWidget);
      expect(find.byType(ProgramIcons), findsOneWidget);
      expect(find.byType(ProgramList), findsOneWidget);

      // Verify scrolling works
      await tester.drag(
        find.byType(SingleChildScrollView),
        const Offset(0, -200),
      );
      await tester.pumpAndSettle();
      expect(find.text('Programs'), findsOneWidget);
    });
  });
}
