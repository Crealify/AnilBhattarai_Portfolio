// // This is a basic Flutter widget test.
// //
// // To perform an interaction with a widget in your test, use the WidgetTester
// // utility in the flutter_test package. For example, you can send tap and scroll
// // gestures. You can also use WidgetTester to find child widgets in the widget
// // tree, read text, and verify that the values of widget properties are correct.

// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';

// import 'package:first_portfolio_2025/main.dart';

// void main() {
//   testWidgets('Counter increments smoke test', (WidgetTester tester) async {
//     // Build our app and trigger a frame.
//     await tester.pumpWidget(const MyApp());

//     // Verify that our counter starts at 0.
//     expect(find.text('0'), findsOneWidget);
//     expect(find.text('1'), findsNothing);

//     // Tap the '+' icon and trigger a frame.
//     await tester.tap(find.byIcon(Icons.add));
//     await tester.pump();

//     // Verify that our counter has incremented.
//     expect(find.text('0'), findsNothing);
//     expect(find.text('1'), findsOneWidget);
//   });
// }

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:first_portfolio_2025/main.dart';

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
