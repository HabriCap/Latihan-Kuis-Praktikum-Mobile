import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:lat_kuis/main.dart';

void main() {
  testWidgets('displays the login form', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Login'), findsNWidgets(2));
    expect(find.text('Username (NIM)'), findsOneWidget);
    expect(find.text('Password (Prodi)'), findsOneWidget);
    expect(find.widgetWithText(ElevatedButton, 'Login'), findsOneWidget);
  });

  testWidgets('logs in with valid credentials', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.enterText(find.byType(TextField).at(0), '124240126');
    await tester.enterText(find.byType(TextField).at(1), 'sistem informasi');
    await tester.tap(find.widgetWithText(ElevatedButton, 'Login'));
    await tester.pumpAndSettle();

    expect(find.text('Animals List'), findsOneWidget);
  });
}
