part of 'pages.dart';

class VerbVocabularyPage extends StatefulWidget {
  const VerbVocabularyPage({super.key});
  @override
  State<VerbVocabularyPage> createState() => _VerbVocabularyPageState();
}

class _VerbVocabularyPageState extends State<VerbVocabularyPage> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: ShumiColors.background,
      appBar: AppBar(
        title: Text(
          '動詞 (Kata Kerja)',
          style: GoogleFonts.notoSansJp(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        foregroundColor: ShumiColors.textDark,
        elevation: 0,
        actions: [
          TextButton.icon(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.home, color: ShumiColors.textLight),
            label: Text(
              'ホーム',
              style: GoogleFonts.notoSansJp(color: ShumiColors.textLight),
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          backgroundImage,
          SafeArea(
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: CharacterBubble(
                      message:
                          'どんな動詞を覚えたいですか？\n(Kata kerja apa yang ingin kamu pelajari?)',
                      characterHeight: 130,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: ListView.builder(
                    padding: const EdgeInsets.only(
                      right: 16,
                      top: 8,
                      bottom: 8,
                    ),
                    itemCount: verbVocabulary.length,
                    itemBuilder: (context, index) {
                      final vocab = verbVocabulary[index];
                      return VocabularyCard(
                        vocab: vocab,
                        onTap: () async {
                          if (vocab.soundAsset != null) {
                            await _audioPlayer.stop();
                            await _audioPlayer.play(
                              AssetSource(vocab.soundAsset!),
                            );
                          }
                        },
                      );
                    },
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

class NounVocabularyPage extends StatefulWidget {
  const NounVocabularyPage({super.key});
  @override
  State<NounVocabularyPage> createState() => _NounVocabularyPageState();
}

class _NounVocabularyPageState extends State<NounVocabularyPage> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: ShumiColors.background,
      appBar: AppBar(
        title: Text(
          '名詞 (Kata Benda)',
          style: GoogleFonts.notoSansJp(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        foregroundColor: ShumiColors.textDark,
        elevation: 0,
        actions: [
          TextButton.icon(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.home, color: ShumiColors.textLight),
            label: Text(
              'ホーム',
              style: GoogleFonts.notoSansJp(color: ShumiColors.textLight),
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          backgroundImage,
          SafeArea(
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: CharacterBubble(
                      message:
                          'どんな名詞を覚えたいですか？\n(Kata benda apa yang ingin kamu pelajari?)',
                      characterHeight: 130,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: ListView.builder(
                    padding: const EdgeInsets.only(
                      right: 16,
                      top: 8,
                      bottom: 8,
                    ),
                    itemCount: nounVocabulary.length,
                    itemBuilder: (context, index) {
                      final vocab = nounVocabulary[index];
                      return VocabularyCard(
                        vocab: vocab,
                        onTap: () async {
                          if (vocab.soundAsset != null) {
                            await _audioPlayer.stop();
                            await _audioPlayer.play(
                              AssetSource(vocab.soundAsset!),
                            );
                          }
                        },
                      );
                    },
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
