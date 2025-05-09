import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart'; // Import go_router

class AboutMemoryCard extends StatelessWidget {
  const AboutMemoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar( // Lebih baik menggunakan AppBar untuk judul halaman
        backgroundColor: const Color(0xFFF9C99E),
        title: const Text(
          'About Page',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 1,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch, // Agar konten mengisi lebar
        children: [
          const SizedBox(height: 20),
          const Text(
            'Game Instructions',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color(0xFFF9C99E),
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFF9C99E),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'Terdapat 6 gambar acak yang tertutup Harus Mencocokkan keenam gambar agar bisa menang!',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  height: 1.5,
                ),
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: ElevatedButton(
              onPressed: () => context.push('/MemoryCard'), // Sekarang akan berfungsi jika AboutPage dibangun di dalam Router
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFF9C99E),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(35),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
              ),
              child: const Text(
                'Play Game',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}