import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'screens/game_page.dart';
import 'screens/about_page.dart';
import 'screens/homepage.dart';
import 'screens/list_games.dart';
import 'screens/AboutMemoryCard.dart';
import 'screens/MemoryCard.dart';
import 'screens/AboutGuessNumber.dart';
import 'screens/GuessTheNumber.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => NavigationProvider(),
      child: const MyGames(),
    )
  );
}

class NavigationProvider extends ChangeNotifier{
  void goToGame(BuildContext context){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const GamePage()),
    );
  }
}

class MyGames extends StatelessWidget {
  const MyGames({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: GoRouter(
        routes: [
          GoRoute(path: '/', builder: (context, state) => const MyHomePage()),
          GoRoute(path: '/listGames', builder: (context, state) => ListGames()),
          GoRoute(path: '/game', builder: (context, state) => const GamePage()),
          GoRoute(path: '/about', builder: (context, state) => const AboutPage()),
          GoRoute(path: '/aboutMemoryCard', builder: (context, state) => const AboutMemoryCard()),
          GoRoute(path:'/MemoryCard', builder: (context, state) => const MemoryCard()),
          GoRoute(path: '/aboutGuessNumber', builder: (context, state) => AboutGuessTheNumber()),
          GoRoute(path:'/GuessTheNumber', builder: (context, state) => GuessTheNumber())
        ],
      ),
      title: 'My Games', // Atau judul lain yang Anda inginkan
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Itim',
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFF9C99E)),
        useMaterial3: true,
      ),
    );
  }
}