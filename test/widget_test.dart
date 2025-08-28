// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_application_2/main.dart';

void main() {
  testWidgets('Profile Card UI elements test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the name is displayed
    expect(find.text('John Doe'), findsOneWidget);

    // Verify that the job title is displayed
    expect(find.text('Flutter Developer'), findsOneWidget);

    // Verify that the email is displayed
    expect(find.text('john.doe@email.com'), findsOneWidget);

    // Verify that the email icon is present
    expect(find.byIcon(Icons.email), findsOneWidget);

    // Verify that CircleAvatar is present
    expect(find.byType(CircleAvatar), findsOneWidget);
  });

  testWidgets('Profile Card Layout test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the Card widget is present
    expect(find.byType(Card), findsOneWidget);

    // Verify that we're using a Column for layout
    expect(find.byType(Column), findsOneWidget);

    // Verify that the layout includes padding
    expect(find.byType(Padding), findsOneWidget);

    // Verify that the card is centered
    expect(find.byType(Center), findsOneWidget);
  });
}
