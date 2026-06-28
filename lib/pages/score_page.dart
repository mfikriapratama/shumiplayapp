import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme.dart';
import 'home_page.dart';

class ScorePage extends StatelessWidget {
  final int score;
  final int total;

  const ScorePage({super.key, required this.score, required this.total});

  double get percentage => (score / total) * 100;

  String get message {
    if (percentage >= 80) return 'すばらしい！ (Luar biasa!)';
    if (percentage >= 60) return 'よくできました！ (Bagus!)';
    return 'もう少し！ (Sedikit lagi!)';
  }

  IconData get icon {
    if (percentage >= 80) return Icons.emoji_events;
    if (percentage >= 60) return Icons.thumb_up;
    return Icons.sentiment_satisfied;
  }

  Color get scoreColor {
    if (percentage >= 80) return ShumiColors.correct;
    if (percentage >= 60) return ShumiColors.accent;
    return ShumiColors.secondary;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ShumiColors.background,
      body: SafeArea(
        child: Row(
          children: [
            // Left: character + congrats
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/character.png', height: 120),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: ShumiColors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                            color: ShumiColors.primary.withValues(alpha: 0.3),
                            width: 2),
                      ),
                      child: Text(
                        'おめでとうございます！\n(Selamat!)',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.notoSansJp(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: ShumiColors.primary),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Right: score + home
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 140,
                    height: 140,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: scoreColor.withValues(alpha: 0.1),
                      border: Border.all(color: scoreColor, width: 4),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(icon, size: 36, color: scoreColor),
                        Text('$score/$total',
                            style: GoogleFonts.poppins(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: scoreColor)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(message,
                      style: GoogleFonts.notoSansJp(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: scoreColor)),
                  Text('${percentage.toStringAsFixed(0)}%',
                      style: GoogleFonts.poppins(
                          fontSize: 16, color: ShumiColors.textLight)),
                  const SizedBox(height: 32),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (_) => const HomePage()),
                        (route) => false,
                      );
                    },
                    icon: const Icon(Icons.home),
                    label: Text('ホーム',
                        style: GoogleFonts.notoSansJp(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ShumiColors.primary,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 14),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
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
