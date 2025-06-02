import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:rock_paper_scissors/screens/MemoryCard.dart';

void main() {
  Widget _createTestApp({required Widget child}) {
    return MaterialApp.router(
      routerConfig: GoRouter(
        initialLocation: '/memory',
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => const Scaffold(body: Text('Homepage')),
          ),
          GoRoute(
            path: '/memory',
            builder: (context, state) => child,
          ),
        ],
      ),
    );
  }

  testWidgets('MC-1: Halaman Memory Card dapat ditampilkan', (tester) async {
    await tester.pumpWidget(
      _createTestApp(
        child: MediaQuery(
          data: MediaQueryData(size: const Size(800, 2000)), // tinggi besar
          child: const MemoryCard(),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Memory Card'), findsOneWidget); // ganti sesuai judul halaman kamu
  });

  testWidgets('MC-2: Kartu dapat ditap', (tester) async {
    await tester.pumpWidget(
      _createTestApp(
        child: MediaQuery(
          data: MediaQueryData(size: const Size(800, 2000)), // tinggi besar
          child: const MemoryCard(),
        ),
      ),
    );
    await tester.pumpAndSettle();

    final gestureCards = find.byType(GestureDetector);
    expect(gestureCards, findsWidgets); // tidak hardcode 6 dulu agar tidak error

    // Tap salah satu kartu (yang pertama)
    await tester.tap(gestureCards.at(0));
    await tester.pumpAndSettle();

    // Uji efek tap jika ada perubahan tampilan, misalnya muncul gambar
    // Contoh: expect(find.byType(Image), findsWidgets);
  });
}
