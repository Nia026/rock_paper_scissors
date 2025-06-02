import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rock_paper_scissors/screens/CoinToss.dart';
import 'package:go_router/go_router.dart';

void main() {
  testWidgets('CoinToss widget basic test', (WidgetTester tester) async {
    // Set ukuran layar cukup besar supaya layout tidak overflow
    tester.binding.window.physicalSizeTestValue = const Size(800, 900);
    tester.binding.window.devicePixelRatioTestValue = 1.0;

    // Karena CoinToss pakai context.go dari go_router, kita bungkus dengan MaterialApp dan GoRouter
    final router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const Scaffold(body: Center(child: Text('Homepage'))),
        ),
        GoRoute(
          path: '/coin',
          builder: (context, state) => const CoinToss(),
        ),
      ],
    );

    await tester.pumpWidget(
      MaterialApp.router(
        routerConfig: router,
      ),
    );

    // Arahkan ke route /coin supaya CoinToss muncul
    router.go('/coin');
    await tester.pumpAndSettle();

    // Cek judul "Coin Toss" ada
    expect(find.text('Coin Toss'), findsOneWidget);

    // Cek tombol "Toss" ada
    expect(find.text('Toss'), findsOneWidget);

    // Cek tombol "Homepage" ada
    expect(find.text('Homepage'), findsOneWidget);

    // Tekan tombol Toss dan pastikan tidak error (hasil teks dan gambar berubah)
    await tester.tap(find.text('Toss'));
    await tester.pump();

    // Tekan tombol Homepage dan pastikan navigasi ke Homepage
    await tester.tap(find.text('Homepage'));
    await tester.pumpAndSettle();

    expect(find.text('Homepage'), findsOneWidget);

    // Reset ukuran layar setelah test
    addTearDown(() {
      tester.binding.window.clearPhysicalSizeTestValue();
      tester.binding.window.clearDevicePixelRatioTestValue();
    });
  });
}
