import 'dart:math';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GuessTheNumber extends StatefulWidget {
  const GuessTheNumber({super.key});

  @override
  State<GuessTheNumber> createState() => _GuessTheNumberState();
}

class _GuessTheNumberState extends State<GuessTheNumber> {
  int _randomNumber = 0;
  int? _guess;
  String _message = '';
  bool _gameWon = false;

  @override
  void initState() {
    super.initState();
    _resetGame();
  }

  void _resetGame() {
    setState(() {
      _randomNumber = Random().nextInt(10) + 1;
      _guess = null;
      _message = '';
      _gameWon = false;
    });
  }

  void _handleGuess(int number) {
    if (_gameWon) return;

    setState(() {
      _guess = number;
      if (_guess == _randomNumber) {
        _message = 'You Win! The number was $_randomNumber';
        _gameWon = true;
      } else if (_guess! < _randomNumber) {
        _message = 'Too Small';
      } else {
        _message = 'Too Large';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final appBarHeight = AppBar().preferredSize.height;
    const pastelPink = Color(0xFFF9C99E);

    return Scaffold(
      backgroundColor: Colors.white, // Mengatur warna background Scaffold menjadi putih
      appBar: AppBar(
        backgroundColor: pastelPink,
        centerTitle: true,
        title: const Text(
          'Guess The Number',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontFamily: 'Itim',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: screenWidth,
          height: screenHeight - appBarHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.05),
                child: Text(
                  'Number',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: pastelPink,
                    fontSize: 32,
                    fontFamily: 'Itim',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Container(
                width: screenWidth * 0.3,
                height: screenWidth * 0.3,
                decoration: BoxDecoration(
                  color: pastelPink,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Text(
                  _gameWon ? '$_randomNumber' : '?',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontFamily: 'Itim',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: pastelPink,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.1,
                      vertical: screenHeight * 0.015,
                    ),
                  ),
                  onPressed: null,
                  child: Text(
                    _message.isNotEmpty ? '$_message' : 'Guess a number',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Itim',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Text(
                _gameWon ? 'You Win!' : '',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xFF7CD86A),
                  fontSize: 36,
                  fontFamily: 'Itim',
                  fontWeight: FontWeight.w400,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: pastelPink,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(35),
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: screenHeight * 0.015,
                          ),
                        ),
                        onPressed: () {
                          _resetGame();
                          context.go('/');
                        },
                        child: const Text(
                          'Homepage',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: 'Itim',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.02),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: pastelPink,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(35),
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: screenHeight * 0.015,
                          ),
                        ),
                        onPressed: _resetGame,
                        child: const Text(
                          'Reset',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: 'Itim',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: screenHeight * 0.05),
                child: Column( // Menggunakan Column untuk mengatur baris
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(5, (index) {
                        final number = index + 1;
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
                          child: SizedBox(
                            width: screenWidth * 0.15,
                            height: screenWidth * 0.15,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: pastelPink,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                padding: EdgeInsets.zero,
                                alignment: Alignment.center,
                              ),
                              onPressed: () => _handleGuess(number),
                              child: Text(
                                '$number',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontFamily: 'Itim',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                    SizedBox(height: screenHeight * 0.008), // Jarak antar baris
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(5, (index) {
                        final number = index + 6;
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
                          child: SizedBox(
                            width: screenWidth * 0.15,
                            height: screenWidth * 0.15,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: pastelPink,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                padding: EdgeInsets.zero,
                                alignment: Alignment.center,
                              ),
                              onPressed: () => _handleGuess(number),
                              child: Text(
                                '$number',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontFamily: 'Itim',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}