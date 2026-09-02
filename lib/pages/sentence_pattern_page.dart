part of 'pages.dart';

class SentencePatternPage extends StatefulWidget {
  const SentencePatternPage({super.key});

  @override
  State<SentencePatternPage> createState() => _SentencePatternPageState();
}

class _SentencePatternPageState extends State<SentencePatternPage> {
  @override
  Widget build(BuildContext context) {
    final title = '文型 (Pola Kalimat)';
    final questionPattern = 'しゅみは なんですか。';
    final answerPattern =
        'しゅみ + は + [Kata Benda Hobi] + を + [Kata Kerja] + こと + です。';

    return Scaffold(
      backgroundColor: ShumiColors.background,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          title,
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
                // Left: character message
                Expanded(
                  flex: 2,
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Center(
                          child: CharacterBubble(
                            message:
                                '文型を覚えましょう！\n(Mari pelajari pola kalimatnya!)',
                            characterHeight: 130,
                          ),
                        ),
                        Text(
                          'Pola "しゅみ + は + Kata Benda + を + Kata Kerja + こと + です" digunakan untuk menyatakan hobi secara spesifik berupa suatu kegiatan. ​Dalam bahasa Jepang, predikat sebelum です (desu) harus berupa kata benda. Karena hobi sering kali berupa kata kerja, kata kerja tersebut harus ditambah こと (koto) agar fungsinya berubah menjadi kata benda. ​Partikel は (wa) bertindak sebagai penanda topik ("Hobi saya adalah..."), sedangkan partikel を (o) menunjukkan objek dari kegiatan yang dilakukan.',
                          style: GoogleFonts.notoSansJp(
                            fontSize: 10,
                            color: ShumiColors.textLight,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Right: pattern + buttons
                Expanded(
                  flex: 3,
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
                            border: Border.all(
                              color: ShumiColors.primary.withValues(alpha: 0.2),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Pola Tanya:',
                                style: GoogleFonts.notoSansJp(
                                  fontSize: 12,
                                  color: ShumiColors.textLight,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                questionPattern,
                                style: GoogleFonts.notoSansJp(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: ShumiColors.primary,
                                ),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                'Pola Jawab:',
                                style: GoogleFonts.notoSansJp(
                                  fontSize: 12,
                                  color: ShumiColors.textLight,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                answerPattern,
                                style: GoogleFonts.notoSansJp(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: ShumiColors.secondary,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => PracticePage()),
                            );
                          },
                          child: Text(
                            'Sudah Paham',
                            style: GoogleFonts.notoSansJp(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
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
