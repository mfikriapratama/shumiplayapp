import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme.dart';
import '../widgets/character_bubble.dart';
import '../widgets/menu_card.dart';
import 'vocabulary_page.dart';
import 'sentence_pattern_page.dart';
import 'quiz_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ShumiColors.background,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('ShumiPlay!',
                      style: GoogleFonts.poppins(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: ShumiColors.primary)),
                  const SizedBox(height: 12),
                  const CharacterBubble(
                    message: '何から始めたいですか？\n(Mau mulai dari mana dulu?)',
                    characterHeight: 120,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: 180,
                        height: 140,
                        child: MenuCard(
                          title: '文型',
                          subtitle: 'Pola Kalimat',
                          icon: Icons.menu_book,
                          color: ShumiColors.primary,
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const SentencePatternPage(isAdvanced: false),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      SizedBox(
                        width: 180,
                        height: 140,
                        child: MenuCard(
                          title: '言葉',
                          subtitle: 'Kosakata',
                          icon: Icons.translate,
                          color: ShumiColors.secondary,
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => const VocabularyPage()),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      SizedBox(
                        width: 180,
                        height: 140,
                        child: MenuCard(
                          title: 'クイズ',
                          subtitle: 'Kuis',
                          icon: Icons.quiz,
                          color: ShumiColors.accent,
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => const QuizPage()),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
