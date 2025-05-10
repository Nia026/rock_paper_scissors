import 'dart:math';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart'; // Import go_router

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
      appBar: AppBar(
        backgroundColor: const Color(0xFFF9C99E),
        centerTitle: true,
        title: const Text(
          'Rock, Paper, Scissors',
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontFamily: 'Itim',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: screen.height),
          child: Container(
            width: screen.width,
            color: Colors.white,
            child: Column(
              children: [
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
                        context.go('/');
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
                          AnimatedPickButton(move: Move.rock, onPlay: play),
                          AnimatedPickButton(move: Move.paper, onPlay: play),
                          AnimatedPickButton(move: Move.scissors, onPlay: play),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
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
}

class AnimatedPickButton extends StatefulWidget {
  final Move move;
  final Function(Move) onPlay;

  const AnimatedPickButton({
    super.key,
    required this.move,
    required this.onPlay,
  });

  @override
  State<AnimatedPickButton> createState() => _AnimatedPickButtonState();
}

class _AnimatedPickButtonState extends State<AnimatedPickButton> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.80).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    )..addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _handleTapUp(TapUpDetails details) {
    _controller.reverse();
    widget.onPlay(widget.move);
  }

  void _handleTapCancel() {
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    String imagePath;
    switch (widget.move) {
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
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTapCancel: _handleTapCancel,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          padding: const EdgeInsets.all(20),
          child: Image.asset(imagePath, width: 60, height: 60),
        ),
      ),
    );
  }
}