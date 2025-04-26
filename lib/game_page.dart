import 'dart:math';
import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

enum Move { rock, paper, scissors }

class _GamePageState extends State<GamePage> {
  Move? playerMove;
  Move? computerMove;
  String result = '';
  int playerScore = 0;
  int computerScore = 0;

  final random = Random();

  void play(Move move) {
    setState(() {
      playerMove = move;
      computerMove = Move.values[random.nextInt(3)];

      if (playerMove == computerMove) {
        result = 'Tie';
      } else if ((playerMove == Move.rock && computerMove == Move.scissors) ||
          (playerMove == Move.paper && computerMove == Move.rock) ||
          (playerMove == Move.scissors && computerMove == Move.paper)) {
        result = 'You Win';
        playerScore++;
      } else {
        result = 'You Lose';
        computerScore++;
      }
    });
  }

  void resetScore() {
    setState(() {
      playerScore = 0;
      computerScore = 0;
      result = '';
      playerMove = null;
      computerMove = null;
    });
  }

  Color getResultColor() {
    switch (result) {
      case 'You Win':
        return Colors.green;
      case 'You Lose':
        return Colors.red;
      case 'Tie':
        return const Color(0xFFF9C99E);
      default:
        return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: screen.width,
          height: screen.height,
          color: Colors.white,
          child: Column(
            children: [
              Container(
                width: screen.width,
                height: 76,
                color: const Color(0xFFF9C99E),
                alignment: Alignment.center,
                child: const Text(
                  'Game Page',
                  style: TextStyle(fontSize: 36, color: Colors.white),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Computer',
                style: TextStyle(fontSize: 30, color: Color(0xFFF9C99E)),
              ),
              const SizedBox(height: 10),
              moveIcon(computerMove),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '$computerScore',
                    style: const TextStyle(fontSize: 36, color: Color(0xFFF9C99E)),
                  ),
                  const SizedBox(width: 20),
                  Text(
                    result,
                    style: TextStyle(
                      fontSize: 30,
                      color: getResultColor(),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Text(
                    '$playerScore',
                    style: const TextStyle(fontSize: 36, color: Color(0xFFF9C99E)),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Text(
                'You',
                style: TextStyle(fontSize: 30, color: Color(0xFFF9C99E)),
              ),
              const SizedBox(height: 10),
              moveIcon(playerMove),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF9C99E),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Homepage', style: TextStyle(fontSize: 20)),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF9C99E),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35),
                      ),
                    ),
                    onPressed: resetScore,
                    child: const Text('Reset Score', style: TextStyle(fontSize: 20)),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                color: const Color(0xFFF9C99E),
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: [
                    const Text(
                      'Pick This:',
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        pickButton(Move.rock),
                        pickButton(Move.paper),
                        pickButton(Move.scissors),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget moveIcon(Move? move) {
    if (move == null) {
      return const Icon(Icons.help_outline, size: 80, color: Colors.grey);
    }
    String imagePath;
    switch (move) {
      case Move.rock:
        imagePath = 'assets/images/rock.png';
        break;
      case Move.paper:
        imagePath = 'assets/images/paper.png';
        break;
      case Move.scissors:
        imagePath = 'assets/images/scissors.png';
        break;
    }
    return Image.asset(imagePath, width: 80, height: 80);
  }

  Widget pickButton(Move move) {
    String imagePath;
    switch (move) {
      case Move.rock:
        imagePath = 'assets/images/rock.png';
        break;
      case Move.paper:
        imagePath = 'assets/images/paper.png';
        break;
      case Move.scissors:
        imagePath = 'assets/images/scissors.png';
        break;
    }

    return GestureDetector(
      onTap: () => play(move),
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        padding: const EdgeInsets.all(20),
        child: Image.asset(imagePath, width: 60, height: 60),
      ),
    );
  }

  Widget mainButton({required String text, required VoidCallback onPressed}) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFF9C99E),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(35),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontFamily: 'Itim',
        ),
      ),
    );
  }
}