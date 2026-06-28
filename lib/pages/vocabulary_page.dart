import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme.dart';
import '../data/vocabulary_data.dart';
import '../widgets/vocabulary_card.dart';
import '../widgets/character_bubble.dart';

class VocabularyPage extends StatefulWidget {
  const VocabularyPage({super.key});

  @override
  State<VocabularyPage> createState() => _VocabularyPageState();
}

class _VocabularyPageState extends State<VocabularyPage> {
  bool showGenres = false;

  @override
  Widget build(BuildContext context) {
    final vocabList = showGenres ? genreVocabulary : hobbyVocabulary;

    return Scaffold(
      backgroundColor: ShumiColors.background,
      appBar: AppBar(
        title: Text(showGenres ? 'ジャンル (Genre)' : '言葉 (Kosakata)',
            style: GoogleFonts.notoSansJp(fontWeight: FontWeight.bold)),
        backgroundColor: ShumiColors.background,
        foregroundColor: ShumiColors.textDark,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Character hint
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CharacterBubble(
              message: showGenres
                  ? 'これらのジャンルが好きですか？\n(Genre ini kamu suka?)'
                  : 'どの趣味が好きですか？\n(Hobi apa yang kamu suka?)',
              characterHeight: 120,
            ),
          ),
          const SizedBox(height: 12),
          // Vocabulary list
          Expanded(
            child: ListView.builder(
              itemCount: vocabList.length,
              itemBuilder: (context, index) {
                final vocab = vocabList[index];
                return VocabularyCard(
                  vocab: vocab,
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('🔊 ${vocab.japanese} — ${vocab.meaning}'),
                        backgroundColor: ShumiColors.primary,
                        duration: const Duration(seconds: 1),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          // Bottom navigation
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Back to home
                TextButton.icon(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.home, color: ShumiColors.textLight),
                  label: Text('ホーム',
                      style: GoogleFonts.notoSansJp(color: ShumiColors.textLight)),
                ),
                // Toggle genre/hobby or go next
                if (!showGenres)
                  ElevatedButton.icon(
                    onPressed: () => setState(() => showGenres = true),
                    icon: const Icon(Icons.arrow_forward),
                    label: Text('次',
                        style: GoogleFonts.notoSansJp(fontWeight: FontWeight.bold)),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: ShumiColors.secondary),
                  )
                else
                  ElevatedButton.icon(
                    onPressed: () => setState(() => showGenres = false),
                    icon: const Icon(Icons.arrow_back),
                    label: Text('戻る',
                        style: GoogleFonts.notoSansJp(fontWeight: FontWeight.bold)),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
