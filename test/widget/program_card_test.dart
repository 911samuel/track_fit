import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:track_fit/core/theme/app_colors.dart';
import 'package:track_fit/core/theme/app_text_styles.dart';
import 'package:track_fit/ui/dashboard/widget/program_card.dart';

void main() {
  testWidgets('ProgramCard reders image, title, and progress bar', (
    tester,
  ) async {
    await mockNetworkImagesFor(() async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ProgramCard(
              imageUrl: 'https://example.com/image.png',
              title: 'Yoga Program',
              progress: 0.75,
            ),
          ),
        ),
      );
      expect(find.text('Yoga Program'), findsOneWidget);
      expect(find.byType(LinearProgressIndicator), findsOneWidget);
      expect(find.byType(Image), findsOneWidget);
      expect(find.text('Yoga Program'), findsOneWidget);
      final linearProgress = tester.widget<LinearProgressIndicator>(
        find.byType(LinearProgressIndicator),
      );
      expect(linearProgress.value, 0.75);
      expect(linearProgress.color, AppColors.primaryNeon);
      final textWidget = tester.widget<Text>(find.text('Yoga Program'));
      expect(textWidget.style, AppTextStyles.h4);
    });
  });
}
