import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MemoryCard extends StatefulWidget {
  const MemoryCard({super.key});

  @override
  State<MemoryCard> createState() => _MemoryCardState();
}

class _MemoryCardState extends State<MemoryCard> {
  List<String> images = [];
  List<bool> isRevealed = [];
  List<int?> selectedIndices = [];
  bool gameWon = false;

  @override
  void initState() {
    super.initState();
    _resetGame();
  }

  void _resetGame() {
    setState(() {
      images = [..._availableImages, ..._availableImages]..shuffle();
      isRevealed = List.generate(6, (index) => false);
      selectedIndices = [];
      gameWon = false;
    });
  }

  final List<String> _availableImages = [
    'assets/images/timmy.jpeg',
    'assets/images/minion.jpeg',
    'assets/images/loppy.jpeg',
  ];

  void _handleCardTap(int index) {
    if (gameWon || isRevealed[index] || selectedIndices.length == 2) {
      return;
    }

    setState(() {
      isRevealed[index] = true;
      selectedIndices.add(index);

      if (selectedIndices.length == 2) {
        int index1 = selectedIndices[0]!;
        int index2 = selectedIndices[1]!;

        if (images[index1] == images[index2]) {
          selectedIndices.clear();
          if (isRevealed.every((element) => element)) {
            gameWon = true;
          }
        } else {
          // Flip back after a delay
          Future.delayed(const Duration(milliseconds: 1000), () {
            setState(() {
              isRevealed[index1] = false;
              isRevealed[index2] = false;
              selectedIndices.clear();
            });
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final cardSize = screenWidth * 0.28;
    final appBarHeight = AppBar().preferredSize.height;
    final topSectionHeight = screenHeight * 0.45;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF9C99E),
        centerTitle: true,
        title: const Text(
          'Memory Card',
          style: TextStyle(
            color: Colors.white,
            fontSize: 32,
            fontFamily: 'Itim',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            top: appBarHeight,
            left: 0,
            right: 0,
            height: topSectionHeight,
            child: Container(
              color: const Color(0xFFF9C99E),
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildCard(0, cardSize),
                      _buildCard(1, cardSize),
                      _buildCard(2, cardSize),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildCard(3, cardSize),
                      _buildCard(4, cardSize),
                      _buildCard(5, cardSize),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: appBarHeight + topSectionHeight + screenHeight * 0.05,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                gameWon ? 'You Win' : '',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xFF7CD86A),
                  fontSize: 36,
                  fontFamily: 'Itim',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: screenHeight * 0.05,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF9C99E),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.08,
                      vertical: screenHeight * 0.015,
                    ),
                  ),
                  onPressed: () {
                    _resetGame();
                    context.go('/');
                  },
                  child: const Text(
                    'Homepage',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Itim',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF9C99E),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.08,
                      vertical: screenHeight * 0.015,
                    ),
                  ),
                  onPressed: _resetGame,
                  child: const Text(
                    'Reset',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Itim',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(int index, double size) {
    return GestureDetector(
      onTap: () => _handleCardTap(index),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: isRevealed[index] ? Colors.white : const Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        child: isRevealed[index]
            ? Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            images[index],
            fit: BoxFit.contain,
          ),
        )
            : null,
      ),
    );
  }
}