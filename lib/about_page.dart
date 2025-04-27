import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 80,
            color: const Color(0xFFF9C99E),
            alignment: Alignment.center,
            child: Text(
              'About Page',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 1,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Game Instructions',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: const Color(0xFFF9C99E),
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFF9C99E),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              'Pilih antara batu, gunting, dan kertas.\n\n'
                  'Jika kamu memilih batu maka akan kalah dari kertas dan menang dari gunting.\n\n'
                  'Jika kamu memilih gunting maka akan kalah dari batu dan menang dari kertas.\n\n'
                  'Jika kamu memilih kertas maka kamu akan kalah dari gunting dan menang dari batu.',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                height: 1.5,
              ),
            ),
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context); // Kembali ke homepage
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFF9C99E),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(35),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
            ),
            child: Text(
              'Homepage',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}