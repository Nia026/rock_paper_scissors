import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ListGames extends StatelessWidget {
  const ListGames({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final buttonHeight = screenHeight * 0.07; // Tinggi tombol yang proporsional

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF9C99E),
        centerTitle: true,
        title: const Text(
          'Game List',
          style: TextStyle(
            color: Colors.white,
            fontSize: 32,
            fontFamily: 'Itim',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: SizedBox(
        width: screenWidth,
        height: screenHeight,
        child: Stack(
          children: [
            Positioned(
              top: screenHeight * 0.12,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  'Play Your Games',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xFFF9C99E),
                    fontSize: 36,
                    fontFamily: 'Itim',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.07),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _GameButton(
                    title: 'Rock, Paper, Scissors',
                    onPressed: () => context.push('/about'),
                    height: buttonHeight,
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  _GameButton(
                    title: 'Memory Card',
                    onPressed: () => context.push('/aboutMemoryCard'),
                    height: buttonHeight,
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  _GameButton(
                    title: 'Guess the Number',
                    onPressed: () => context.push('/aboutGuessNumber'),
                    height: buttonHeight,
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  _GameButton(
                    title: 'Coin Toss',
                    onPressed: () => context.push('/cointoss'),
                    height: buttonHeight,
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  _GameButton(
                    title: 'Dice Roll',
                    onPressed: () => context.push('/diceroll'),
                    height: buttonHeight,
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: screenHeight * 0.05,
              left: 0,
              right: 0,
              child: Center(
                child: SizedBox(
                  width: screenWidth * 0.40,
                  height: screenHeight * 0.05,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF9C99E),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35),
                      ),
                    ),
                    onPressed: () => context.go('/'),
                    child: const Text(
                      'Homepage',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'Itim',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _GameButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final double height;

  const _GameButton({
    required this.title,
    required this.onPressed,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    double fontSize = 20;
    // if (title.length > 18) {
    //   fontSize = 20; // Kecilkan font jika judul terlalu panjang
    // }

    return SizedBox(
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFF9C99E),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(35),
          ),
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: screenWidth * 0.6,
              child: Text(
                title,
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: fontSize,
                  fontFamily: 'Itim',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}