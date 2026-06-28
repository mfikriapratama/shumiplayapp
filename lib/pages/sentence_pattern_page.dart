import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../theme.dart';
import '../widgets/character_bubble.dart';
import 'practice_page.dart';

class SentencePatternPage extends StatefulWidget {
  final bool isAdvanced;
  const SentencePatternPage({super.key, required this.isAdvanced});

  @override
  State<SentencePatternPage> createState() => _SentencePatternPageState();
}

class _SentencePatternPageState extends State<SentencePatternPage> {
  late YoutubePlayerController _ytController;
  bool _showConfirm = false;

  @override
  void initState() {
    super.initState();
    // Japanese hobby learning videos
    final videoId = widget.isAdvanced
        ? 'OmIRsRHPsS4'  // 趣味は何ですか Japanese conversation practice
        : 'rMfxuE8hSgo'; // Japanese Vocabulary - Hobbies 趣味
    _ytController = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(autoPlay: false, mute: false),
    );
  }

  @override
  void dispose() {
    _ytController.dispose();
    super.dispose();
  }

  void _onVideoEnded() {
    setState(() {
      _showConfirm = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final title = widget.isAdvanced ? '文型 (Lanjutan)' : '文型 (Pola Kalimat)';
    final questionPattern = widget.isAdvanced
        ? 'どんな ＋ KB Kategori ＋ が すきですか。'
        : 'しゅみは なんですか。';
    final answerPattern = widget.isAdvanced
        ? 'わたしは ＋ KB Spesifik ＋ が すきです。'
        : 'わたしのしゅみは ＋ [KB Hobi] ＋ です。';

    return Scaffold(
      backgroundColor: ShumiColors.background,
      appBar: AppBar(
        title: Text(title, style: GoogleFonts.notoSansJp(fontWeight: FontWeight.bold)),
        backgroundColor: ShumiColors.background,
        foregroundColor: ShumiColors.textDark,
        elevation: 0,
      ),
      body: Row(
        children: [
          // Left: video + character
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  CharacterBubble(
                    message: widget.isAdvanced
                        ? 'では、もっと詳しく話しましょう！\n(Mari bicara lebih spesifik!)'
                        : 'まず、動画を見てください！\n(Pertama, tonton videonya!)',
                    characterHeight: 80,
                  ),
                  const SizedBox(height: 12),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: YoutubePlayer(
                        controller: _ytController,
                        showVideoProgressIndicator: true,
                        onEnded: (_) => _onVideoEnded(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Right: pattern + buttons
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: ShumiColors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: ShumiColors.primary.withValues(alpha: 0.2)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Pola Tanya:',
                            style: GoogleFonts.notoSansJp(
                                fontSize: 12, color: ShumiColors.textLight)),
                        const SizedBox(height: 4),
                        Text(questionPattern,
                            style: GoogleFonts.notoSansJp(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: ShumiColors.primary)),
                        const SizedBox(height: 12),
                        Text('Pola Jawab:',
                            style: GoogleFonts.notoSansJp(
                                fontSize: 12, color: ShumiColors.textLight)),
                        const SizedBox(height: 4),
                        Text(answerPattern,
                            style: GoogleFonts.notoSansJp(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: ShumiColors.secondary)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  if (!_showConfirm)
                    Text('Apakah sudah paham?',
                        style: GoogleFonts.notoSansJp(
                            fontSize: 14, color: ShumiColors.textLight)),
                  if (_showConfirm)
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {
                              _ytController.seekTo(Duration.zero);
                              _ytController.play();
                              setState(() => _showConfirm = false);
                            },
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              side: const BorderSide(color: ShumiColors.textLight),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                            ),
                            child: Text('Belum',
                                style: GoogleFonts.notoSansJp(
                                    color: ShumiColors.textLight)),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => PracticePage(
                                      isAdvanced: widget.isAdvanced),
                                ),
                              );
                            },
                            child: Text('Sudah',
                                style: GoogleFonts.notoSansJp(
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ],
                    ),
                  const SizedBox(height: 12),
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('← ホームに戻る',
                        style: GoogleFonts.notoSansJp(
                            color: ShumiColors.textLight)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
