import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme.dart';
import 'home_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ShumiColors.background,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: ShumiColors.primary.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.play_circle_fill,
                    size: 80, color: ShumiColors.primary),
              ),
              const SizedBox(height: 24),
              // App name
              Text(
                'ShumiPlay!',
                style: GoogleFonts.poppins(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: ShumiColors.primary,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'LET\'S PLAY!',
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: ShumiColors.secondary,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'わたしの趣味!',
                style: GoogleFonts.notoSansJp(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: ShumiColors.textDark,
                ),
              ),
              const SizedBox(height: 32),
              // Character
              Image.asset('assets/images/character.png', height: 200),
              const SizedBox(height: 16),
              // Bubble chat
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 32),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: ShumiColors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                      color: ShumiColors.primary.withValues(alpha: 0.3), width: 2),
                ),
                child: Text(
                  'こんにちは、はじめまして！\nわたしはこのアプリケーションのキャラクターです。',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.notoSansJp(
                    fontSize: 16,
                    color: ShumiColors.textDark,
                    height: 1.5,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              // START button
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => const HomePage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: ShumiColors.secondary,
                  padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 18),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
                child: Text(
                  'START',
                  style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: ShumiColors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
