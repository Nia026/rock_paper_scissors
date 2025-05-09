import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF9C99E),
        centerTitle: true,
        title: const Text(
          'Homepage',
          style: TextStyle(
            fontSize: 28,
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            top: screenHeight * 0.02,
            left: screenWidth * 0.05,
            child: Transform.rotate(
              angle: -0.45,
              child: Image.asset(
                'assets/images/paper.png',
                width: screenWidth * 0.4,
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.10,
            right: screenWidth * 0.05,
            child: Transform.rotate(
              angle: 0.35,
              child: Image.asset(
                'assets/images/scissors.png',
                width: screenWidth * 0.4,
              ),
            ),
          ),
          Positioned(
            bottom: screenHeight * 0.05,
            left: screenWidth * 0.1,
            child: Transform.rotate(
              angle: -0.65,
              child: Image.asset(
                'assets/images/rock.png',
                width: screenWidth * 0.4,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'My Games',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 32,
                      color: Color(0xFFF9C99E),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 40),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF9C99E),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 14),
                    ),
                    onPressed: () => context.go('/listGames'),
                    child: const Text(
                      'List Games',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}