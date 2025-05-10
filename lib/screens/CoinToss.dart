import 'dart:math';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CoinToss extends StatefulWidget {
  const CoinToss({super.key});

  @override
  State<CoinToss> createState() => _CoinTossState();
}

class _CoinTossState extends State<CoinToss> {
  String _coinSide = 'number'; // Default side
  String _displayText = 'Number';
  String _imagePath = 'assets/images/coin_number.png'; // Default image path

  void _tossCoin() {
    final random = Random();
    setState(() {
      if (random.nextBool()) {
        _coinSide = 'person';
        _displayText = 'Person';
        _imagePath = 'assets/images/coin_person.png';
      } else {
        _coinSide = 'number';
        _displayText = 'Number';
        _imagePath = 'assets/images/coin_number.png';
      }
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
          'Coin Toss',
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
          mainAxisAlignment: MainAxisAlignment.start, // Mengubah mainAxisAlignment ke start
          children: [
            Padding(
              padding: EdgeInsets.only(top: screenHeight * 0.03), // Memberikan jarak ke teks hasil
              child: Text(
                _displayText, // Menampilkan _displayText yang berisi "Number" atau "Person"
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: pastelPink,
                  fontSize: 32,
                  fontFamily: 'Itim',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: screenHeight * 0.03), // Memberikan sedikit jarak ke gambar
              child: Container(
                width: screenWidth * 0.4,
                height: screenWidth * 0.4,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(_imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            // const Spacer(), // Mendorong tombol ke bawah
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1, vertical: screenHeight * 0.05), // Padding bawah untuk tombol
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
                      onPressed: _tossCoin,
                      child: const Text(
                        'Toss',
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
          ],
        ),
      ),
    );
  }
}