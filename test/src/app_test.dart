import 'package:contador/src/app.dart';
import 'package:contador/src/pages/contador_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('MyApp basic widgets', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    expect(find.byType(MaterialApp), findsOneWidget);
    expect(find.byKey(Key('mainCenter')), findsOneWidget);
    expect(find.byType(ContadorPage), findsOneWidget);
    expect(find.byType(Icon), findsNWidgets(3));
    expect(find.text('Scaffold'), findsOneWidget);
    expect(find.text('Número de taps:'), findsOneWidget);
  });

  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(new MyApp());

    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });

  testWidgets('Counter decrements smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(new MyApp());

    expect(find.text('0'), findsOneWidget);
    expect(find.text('-1'), findsNothing);

    await tester.tap(find.byIcon(Icons.remove));
    await tester.pump();

    expect(find.text('0'), findsNothing);
    expect(find.text('-1'), findsOneWidget);
  });

  testWidgets('Counter zero smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(new MyApp());

    expect(find.text('0'), findsOneWidget);
    expect(find.text('-1'), findsNothing);

    await tester.tap(find.byIcon(Icons.remove));
    await tester.pump();

    expect(find.text('0'), findsNothing);
    expect(find.text('-1'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.exposure_zero));
    await tester.pump();

    expect(find.text('-1'), findsNothing);
    expect(find.text('0'), findsOneWidget);
  });
}
