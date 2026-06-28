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
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              // Title
              Text(
                'ShumiPlay!',
                style: GoogleFonts.poppins(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: ShumiColors.primary,
                ),
              ),
              const SizedBox(height: 16),
              // Character bubble
              const CharacterBubble(
                message: '何から始めたいですか？\n(Mau mulai dari mana dulu?)',
                characterHeight: 150,
              ),
              const SizedBox(height: 24),
              // Menu grid
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  children: [
                    MenuCard(
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
                    MenuCard(
                      title: '言葉',
                      subtitle: 'Kosakata',
                      icon: Icons.translate,
                      color: ShumiColors.secondary,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const VocabularyPage()),
                      ),
                    ),
                    MenuCard(
                      title: 'クイズ',
                      subtitle: 'Kuis',
                      icon: Icons.quiz,
                      color: ShumiColors.accent,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const QuizPage()),
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
