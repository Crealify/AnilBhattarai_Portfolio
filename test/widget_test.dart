import 'package:anil_bhattarai_portfolio/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Portfolio app renders correctly', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const PortfolioApp());

    // Verify that the app title is displayed
    expect(find.text('Anil Bhattara'), findsOneWidget);

    // Verify that the About Me section is present
    expect(find.text('About Me'), findsOneWidget);

    // Verify that the Skills section is present
    expect(find.text('Skills'), findsOneWidget);

    // Verify that at least one skill chip is present
    expect(find.byType(Chip), findsWidgets);

    // Verify that the Projects section is present
    expect(find.text('Projects'), findsOneWidget);

    // Verify that at least one project card is present
    expect(find.byType(Card), findsWidgets);

    // Verify that the Contact section is present
    expect(find.text('Contact'), findsOneWidget);
  });

  testWidgets('Contact information is present', (WidgetTester tester) async {
    await tester.pumpWidget(const PortfolioApp());

    // Verify email is present
    expect(find.text('bhattaraiani2015@gmail.com'), findsOneWidget);

    // Verify phone number is present
    expect(find.text('+977-9867294376'), findsOneWidget);

    // Verify social media buttons are present
    expect(find.byIcon(Icons.facebook), findsOneWidget);
    expect(find.byIcon(Icons.code), findsOneWidget);
    expect(find.byIcon(Icons.work), findsOneWidget);
  });
}
