import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme.dart';
import '../data/vocabulary_data.dart';
import '../widgets/character_bubble.dart';
import '../models/vocabulary.dart';

class PracticePage extends StatefulWidget {
  final bool isAdvanced;
  const PracticePage({super.key, required this.isAdvanced});

  @override
  State<PracticePage> createState() => _PracticePageState();
}

class _PracticePageState extends State<PracticePage> {
  Vocabulary? _selected;
  bool? _isCorrect;
  int _currentStep = 0;

  List<Vocabulary> get _options =>
      widget.isAdvanced ? genreVocabulary : hobbyVocabulary;

  void _onSelect(Vocabulary vocab) {
    if (_isCorrect != null) return;
    setState(() {
      _selected = vocab;
      _isCorrect = true; // Any selection is "correct" in this practice
    });
  }

  void _next() {
    if (_currentStep < 2) {
      setState(() {
        _currentStep++;
        _selected = null;
        _isCorrect = null;
      });
    } else {
      _showComplete();
    }
  }

  void _showComplete() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text('おめでとうございます！',
            textAlign: TextAlign.center,
            style: GoogleFonts.notoSansJp(
                fontWeight: FontWeight.bold, color: ShumiColors.correct)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.celebration, size: 60, color: ShumiColors.accent),
            const SizedBox(height: 16),
            Text('Latihan selesai!',
                style: GoogleFonts.notoSansJp(fontSize: 18)),
          ],
        ),
        actions: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(ctx).pop();
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
              style: ElevatedButton.styleFrom(backgroundColor: ShumiColors.primary),
              child: Text('ホーム',
                  style: GoogleFonts.notoSansJp(fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final questions = widget.isAdvanced
        ? [
            'どんなスポーツがすきですか。\n(Olahraga apa yang kamu suka?)',
            'どんなおんがくがすきですか。\n(Musik apa yang kamu suka?)',
            'どんな ものが すきですか。\n(Barang apa yang kamu suka?)',
          ]
        : [
            'しゅみは なんですか。\n(Hobi kamu apa?)',
            'あなたのしゅみは なんですか。\n(Apa hobimu?)',
            'しゅみは なんですか。\n(Hobi kamu apa?)',
          ];

    return Scaffold(
      backgroundColor: ShumiColors.background,
      appBar: AppBar(
        title: Text('れんしゅう (Latihan)',
            style: GoogleFonts.notoSansJp(fontWeight: FontWeight.bold)),
        backgroundColor: ShumiColors.background,
        foregroundColor: ShumiColors.textDark,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Character asks
            CharacterBubble(
              message: questions[_currentStep],
              characterHeight: 120,
            ),
            const SizedBox(height: 20),
            // Options grid
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemCount: _options.length,
                itemBuilder: (context, index) {
                  final vocab = _options[index];
                  final isSelected = _selected == vocab;
                  return Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () => _onSelect(vocab),
                      borderRadius: BorderRadius.circular(12),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? (_isCorrect == true
                                  ? ShumiColors.correct.withValues(alpha: 0.1)
                                  : ShumiColors.incorrect.withValues(alpha: 0.1))
                              : ShumiColors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: isSelected
                                ? (_isCorrect == true
                                    ? ShumiColors.correct
                                    : ShumiColors.incorrect)
                                : ShumiColors.primary.withValues(alpha: 0.2),
                            width: 2,
                          ),
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(vocab.japanese,
                                  style: GoogleFonts.notoSansJp(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: ShumiColors.primary)),
                              Text(vocab.meaning,
                                  style: GoogleFonts.notoSansJp(
                                      fontSize: 12, color: ShumiColors.textLight)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            // Feedback + navigation
            if (_selected != null) ...[
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: ShumiColors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  widget.isAdvanced
                      ? 'わたしは ${_selected!.japanese} がすきです。'
                      : 'わたしのしゅみは ${_selected!.japanese} です。',
                  style: GoogleFonts.notoSansJp(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: ShumiColors.primary),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        side: const BorderSide(color: ShumiColors.textLight),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      child: Text('戻る',
                          style: GoogleFonts.notoSansJp(color: ShumiColors.textLight)),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _next,
                      child: Text('次へ',
                          style: GoogleFonts.notoSansJp(fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
