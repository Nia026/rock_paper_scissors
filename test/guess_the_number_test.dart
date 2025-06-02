import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rock_paper_scissors/screens/GuessTheNumber.dart';

void main() {
  testWidgets('GuessTheNumber widget basic test', (WidgetTester tester) async {
    // Set ukuran layar dengan tinggi cukup besar supaya muat semua isi widget
    tester.binding.window.physicalSizeTestValue = const Size(800, 900);
    tester.binding.window.devicePixelRatioTestValue = 1.0;

    await tester.pumpWidget(
      MaterialApp(home: GuessTheNumber()),
    );

    expect(find.text('Guess The Number'), findsOneWidget);

    addTearDown(() {
      tester.binding.window.clearPhysicalSizeTestValue();
      tester.binding.window.clearDevicePixelRatioTestValue();
    });
  });
}
