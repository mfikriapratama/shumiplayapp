part of 'pages.dart';

class PracticePage extends StatefulWidget {
  const PracticePage({super.key});

  @override
  State<PracticePage> createState() => _PracticePageState();
}

class _PracticePageState extends State<PracticePage> {
  Vocabulary? _selectedNoun;
  Vocabulary? _selectedVerb;

  void _reset() {
    setState(() {
      _selectedNoun = null;
      _selectedVerb = null;
    });
  }

  void _showComplete() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(
          'おめでとうございます！',
          textAlign: TextAlign.center,
          style: GoogleFonts.notoSansJp(
            fontWeight: FontWeight.bold,
            color: ShumiColors.correct,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.celebration, size: 60, color: ShumiColors.accent),
            const SizedBox(height: 16),
            Text(
              'Latihan selesai!',
              style: GoogleFonts.notoSansJp(fontSize: 18),
            ),
            const SizedBox(height: 16),
            Text(
              'わたしの しゅみは '
              '${_selectedNoun!.japanese}を '
              '${_selectedVerb!.japanese}ことです。',
              textAlign: TextAlign.center,
              style: GoogleFonts.notoSansJp(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: ShumiColors.primary,
              ),
            ),
          ],
        ),
        actions: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(ctx).pop();
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: ShumiColors.primary,
              ),
              child: Text(
                'ホーム',
                style: GoogleFonts.notoSansJp(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVocabularyGrid({
    required String title,
    required List<Vocabulary> items,
    required Vocabulary? selected,
    required ValueChanged<Vocabulary> onSelected,
  }) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.notoSansJp(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: ShumiColors.primary,
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.zero,
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:
                    2, // Diubah ke 2 kolom agar teks tidak berumpuk/overflow
                childAspectRatio: 2.2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
              ),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final vocab = items[index];
                final isSelected = selected == vocab;

                return Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () => onSelected(vocab),
                    borderRadius: BorderRadius.circular(10),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 4,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? ShumiColors.correct.withValues(alpha: 0.1)
                            : ShumiColors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: isSelected
                              ? ShumiColors.correct
                              : ShumiColors.primary.withValues(alpha: 0.2),
                          width: 1.5,
                        ),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                vocab.japanese,
                                style: GoogleFonts.notoSansJp(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: ShumiColors.primary,
                                ),
                              ),
                            ),
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                vocab.meaning,
                                style: GoogleFonts.notoSansJp(
                                  fontSize: 10,
                                  color: ShumiColors.textLight,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final hasSelection = _selectedNoun != null && _selectedVerb != null;

    return Scaffold(
      backgroundColor: ShumiColors.background,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          'れんしゅう (Latihan)',
          style: GoogleFonts.notoSansJp(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        foregroundColor: ShumiColors.textDark,
        elevation: 0,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          backgroundImage,
          SafeArea(
            child: Row(
              children: [
                // LEFT (Dibungkus SingleChildScrollView agar tidak overflow)
                Expanded(
                  flex: 2,
                  child: Center(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CharacterBubble(
                            message:
                                'しゅみの ぶんを つくりましょう！\n'
                                '(Mari buat kalimat hobi!)',
                            characterHeight: 90,
                          ),
                          const SizedBox(height: 12),

                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: ShumiColors.white,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  'しゅみは',
                                  style: GoogleFonts.notoSansJp(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: ShumiColors.primary,
                                  ),
                                ),
                                Text(
                                  _selectedNoun?.japanese ?? '[Kata Benda]',
                                  style: GoogleFonts.notoSansJp(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: _selectedNoun == null
                                        ? ShumiColors.textLight
                                        : ShumiColors.secondary,
                                  ),
                                ),
                                Text(
                                  'を',
                                  style: GoogleFonts.notoSansJp(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  _selectedVerb?.japanese ?? '[Kata Kerja]',
                                  style: GoogleFonts.notoSansJp(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: _selectedVerb == null
                                        ? ShumiColors.textLight
                                        : ShumiColors.secondary,
                                  ),
                                ),
                                Text(
                                  'ことです。',
                                  style: GoogleFonts.notoSansJp(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: ShumiColors.primary,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          if (hasSelection) ...[
                            const SizedBox(height: 12),
                            Text(
                              'わたしの しゅみは '
                              '${_selectedNoun!.japanese}を '
                              '${_selectedVerb!.japanese}ことです。',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.notoSansJp(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: ShumiColors.primary,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                Expanded(
                                  child: OutlinedButton(
                                    onPressed: _reset,
                                    style: OutlinedButton.styleFrom(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 8,
                                      ),
                                    ),
                                    child: Text(
                                      'やり直す',
                                      style: GoogleFonts.notoSansJp(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: _showComplete,
                                    style: ElevatedButton.styleFrom(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 8,
                                      ),
                                    ),
                                    child: Text(
                                      '次へ',
                                      style: GoogleFonts.notoSansJp(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                ),

                // RIGHT
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        _buildVocabularyGrid(
                          title: '① Kata Benda Hobi',
                          items: nounVocabulary,
                          selected: _selectedNoun,
                          onSelected: (vocab) {
                            setState(() {
                              _selectedNoun = vocab;
                            });
                          },
                        ),
                        const SizedBox(width: 12),
                        _buildVocabularyGrid(
                          title: '② Kata Kerja',
                          items: verbVocabulary,
                          selected: _selectedVerb,
                          onSelected: (vocab) {
                            setState(() {
                              _selectedVerb = vocab;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
