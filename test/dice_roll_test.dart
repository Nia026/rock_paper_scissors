import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rock_paper_scissors/screens/DiceRoll.dart';
import 'package:go_router/go_router.dart';

void main() {
  testWidgets('DiceRoll widget basic test', (WidgetTester tester) async {
    // Set ukuran layar agar layout muat dan tidak overflow
    tester.binding.window.physicalSizeTestValue = const Size(800, 900);
    tester.binding.window.devicePixelRatioTestValue = 1.0;

    // Setup GoRouter dengan route homepage dan dice roll
    final router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const Scaffold(body: Center(child: Text('Homepage'))),
        ),
        GoRoute(
          path: '/dice',
          builder: (context, state) => const DiceRoll(),
        ),
      ],
    );

    // Jalankan app dengan router
    await tester.pumpWidget(
      MaterialApp.router(
        routerConfig: router,
      ),
    );

    // Navigasi ke /dice untuk buka halaman DiceRoll
    router.go('/dice');
    await tester.pumpAndSettle();

    // Cek judul Dice Roll muncul
    expect(find.text('Dice Roll'), findsOneWidget);

    // Cek tombol Roll ada
    expect(find.text('Roll'), findsOneWidget);

    // Cek tombol Homepage ada
    expect(find.text('Homepage'), findsOneWidget);

    // Tap tombol Homepage dan pastikan pindah ke halaman Homepage
    await tester.tap(find.text('Homepage'));
    await tester.pumpAndSettle();

    expect(find.text('Homepage'), findsOneWidget);

    // Reset ukuran layar setelah test selesai
    addTearDown(() {
      tester.binding.window.clearPhysicalSizeTestValue();
      tester.binding.window.clearDevicePixelRatioTestValue();
    });
  });
}
