part of 'pages.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ShumiColors.background,
      body: Stack(
        fit: StackFit.expand,
        children: [
          backgroundImage,
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 16,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 12),
                      const CharacterBubble(
                        message: '何から始めたいですか？',
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
                                  builder: (_) => const SentencePatternPage(

                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          SizedBox(
                            width: 180,
                            height: 140,
                            child: MenuCard(
                              title: '名詞',
                              subtitle: 'Kata Benda',
                              icon: Icons.inventory_2_rounded,
                              color: ShumiColors.secondary,
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const NounVocabularyPage(),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          SizedBox(
                            width: 180,
                            height: 140,
                            child: MenuCard(
                              title: '動詞',
                              subtitle: 'Kata Kerja',
                              icon: Icons.translate,
                              color: ShumiColors.secondary,
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const VerbVocabularyPage(),
                                ),
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
                              icon: Icons.quiz_rounded,
                              color: ShumiColors.accent,
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const QuizPage(),
                                ),
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
        ],
      ),
    );
  }
}
