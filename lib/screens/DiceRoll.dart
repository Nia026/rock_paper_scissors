import 'dart:math';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DiceRoll extends StatefulWidget {
  const DiceRoll({super.key});

  @override
  State<DiceRoll> createState() => _DiceRollState();
}

class _DiceRollState extends State<DiceRoll> {
  int _diceNumber = 1; // Default dice number
  String _displayText = 'Dice 1';
  String _imagePath = 'assets/images/dice_1.png'; // Default image path
  final Random _random = Random();

  void _rollDice() {
    setState(() {
      _diceNumber = _random.nextInt(6) + 1;
      _displayText = 'Dice $_diceNumber';
      _imagePath = 'assets/images/dice_$_diceNumber.png';
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    const pastelPink = Color(0xFFF9C99E);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: pastelPink,
        centerTitle: true,
        title: const Text(
          'Dice Roll',
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontFamily: 'Itim',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: SizedBox(
        width: screenWidth,
        height: screenHeight - AppBar().preferredSize.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start, // Tetap menggunakan start
          children: [
            Padding(
              padding: EdgeInsets.only(top: screenHeight * 0.03), // Mengurangi padding atas
              child: Text(
                _displayText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: pastelPink,
                  fontSize: 32,
                  fontFamily: 'Itim',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: screenHeight * 0.03), // Sedikit mengurangi jarak ke gambar
              child: Container(
                width: screenWidth * 0.35, // Sedikit mengecilkan ukuran dadu
                height: screenWidth * 0.35,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(_imagePath),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            // const Spacer(flex: 2), // Mengurangi ruang kosong di tengah
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1, vertical: screenHeight * 0.05), // Mengurangi padding vertikal tombol
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
                      onPressed: () => context.go('/'),
                      child: const Text(
                        'Homepage',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Itim',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.05),
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
                      onPressed: _rollDice,
                      child: const Text(
                        'Roll',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Itim',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.02), // Menambahkan sedikit ruang di bawah tombol
          ],
        ),
      ),
    );
  }
}