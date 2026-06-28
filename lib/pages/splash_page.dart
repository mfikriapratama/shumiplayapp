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
        child: Row(
          children: [
            // Left: character + bubble
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/character.png', height: 140),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.all(12),
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
                          fontSize: 14,
                          color: ShumiColors.textDark,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Right: title + start
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: ShumiColors.primary.withValues(alpha: 0.1),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.play_circle_fill,
                        size: 50, color: ShumiColors.primary),
                  ),
                  const SizedBox(height: 12),
                  Text('ShumiPlay!',
                      style: GoogleFonts.poppins(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: ShumiColors.primary)),
                  Text('LET\'S PLAY!',
                      style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: ShumiColors.secondary)),
                  const SizedBox(height: 8),
                  Text('わたしの趣味!',
                      style: GoogleFonts.notoSansJp(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: ShumiColors.textDark)),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (_) => const HomePage()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ShumiColors.secondary,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 48, vertical: 14),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                    child: Text('START',
                        style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: ShumiColors.white)),
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
