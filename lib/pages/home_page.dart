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
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              // Left: character + bubble
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('ShumiPlay!',
                        style: GoogleFonts.poppins(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: ShumiColors.primary)),
                    const SizedBox(height: 12),
                    const Expanded(
                      child: CharacterBubble(
                        message: '何から始めたいですか？\n(Mau mulai dari mana dulu?)',
                        characterHeight: 130,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              // Right: menu grid
              Expanded(
                flex: 3,
                child: GridView.count(
                  crossAxisCount: 3,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 1.3,
                  children: [
                    MenuCard(
                      title: '文型',
                      subtitle: 'Pola Kalimat',
                      icon: Icons.menu_book,
                      color: ShumiColors.primary,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              const SentencePatternPage(isAdvanced: false),
                        ),
                      ),
                    ),
                    MenuCard(
                      title: '言葉',
                      subtitle: 'Kosakata',
                      icon: Icons.translate,
                      color: ShumiColors.secondary,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const VocabularyPage()),
                      ),
                    ),
                    MenuCard(
                      title: 'クイズ',
                      subtitle: 'Kuis',
                      icon: Icons.quiz,
                      color: ShumiColors.accent,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const QuizPage()),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
