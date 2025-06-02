import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rock_paper_scissors/screens/game_page.dart';
import 'package:go_router/go_router.dart';

void main() {
  Widget _createTestApp({required Widget child}) {
    return MaterialApp.router(
      routerConfig: GoRouter(
        initialLocation: '/game',
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => const Scaffold(body: Text('Homepage')),
          ),
          GoRoute(
            path: '/game',
            builder: (context, state) => child,
          ),
        ],
      ),
    );
  }

  testWidgets('BGK-1: Tampilan awal menampilkan 0-0 dan ikon tanda tanya', (tester) async {
    await tester.pumpWidget(_createTestApp(child: const GamePage()));
    await tester.pumpAndSettle();

    expect(find.text('Computer'), findsOneWidget);
    expect(find.text('You'), findsOneWidget);
    expect(find.text('0'), findsNWidgets(2));
    expect(find.byIcon(Icons.help_outline), findsNWidgets(2));
    expect(find.byType(AnimatedPickButton), findsNWidgets(3));
  });

  testWidgets('BGK-2: Reset Score mengembalikan ke kondisi awal', (tester) async {
    await tester.pumpWidget(_createTestApp(child: const GamePage()));
    await tester.pumpAndSettle();

    // Mainkan satu ronde
    final buttons = tester.widgetList<AnimatedPickButton>(
        find.byType(AnimatedPickButton)).toList();
    final gesture = await tester.startGesture(tester.getCenter(find.byWidget(buttons[1])));
    await tester.pump();
    await gesture.up();
    await tester.pumpAndSettle();

    // Reset
    await tester.tap(find.widgetWithText(ElevatedButton, 'Reset Score'));
    await tester.pumpAndSettle();

    expect(find.text('0'), findsNWidgets(2));
    expect(find.byIcon(Icons.help_outline), findsNWidgets(2));
  });

  testWidgets('BGK-CT-2: Navigasi ke Homepage berhasil', (tester) async {
    await tester.pumpWidget(_createTestApp(child: const GamePage()));
    await tester.pumpAndSettle();

    await tester.tap(find.widgetWithText(ElevatedButton, 'Homepage'));
    await tester.pumpAndSettle();

    expect(find.text('Homepage'), findsOneWidget);
  });
}
