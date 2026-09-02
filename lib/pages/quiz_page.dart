part of 'pages.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _currentIndex = 0;
  int _score = 0;
  String? _selectedAnswer;
  bool? _isCorrect;
  final TextEditingController _essayController = TextEditingController();

  QuizQuestion get _current => quizQuestions[_currentIndex];

  void _onSelect(String answer) {
    if (_isCorrect != null) return;

    setState(() {
      _selectedAnswer = answer;

      if (_current.type == QuestionType.essay) {
        // 1. Clean & format input user dan kunci jawaban
        final cleanedUserAnswer = answer.trim().toLowerCase();

        // 2. Jika kunci jawaban mendukung multiple alternatif (dipisah koma)
        final validAnswers = _current.answer
            .split(',')
            .map((a) => a.trim().toLowerCase())
            .toList();

        // 3. Cek apakah jawaban pengguna cocok dengan salah satu jawaban valid
        _isCorrect = validAnswers.contains(cleanedUserAnswer);
      } else {
        // Untuk pilihan ganda
        _isCorrect = answer == _current.answer;
      }

      if (_isCorrect!) {
        _score++;
      }
    });
  }

  void _next() {
    if (_currentIndex < quizQuestions.length - 1) {
      setState(() {
        _currentIndex++;
        _selectedAnswer = null;
        _isCorrect = null;
        _essayController.clear();
      });
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => ScorePage(score: _score, total: quizQuestions.length),
        ),
      );
    }
  }

  // Getter gambar berdasarkan status jawaban saat ini
  String get _characterImage {
    if (_isCorrect == null) {
      return 'assets/images/character.png'; // Netral saat belum menjawab
    }
    return _isCorrect!
        ? 'assets/images/char_true_end.png' // Benar saat _isCorrect == true
        : 'assets/images/char_false_end.png'; // Salah saat _isCorrect == false
  }

  String get _characterMessage {
    if (_isCorrect == null) {
      return _currentIndex == 0
          ? '頑張って！ (Semangat!)\nAkhirnya tiba di kuis!'
          : '問題を選んでね！\n(Pilih jawabanmu!)';
    }
    return _isCorrect!
        ? 'すごい！ (Hebat!)\nJawabanmu benar!'
        : '残念！ (Sayang sekali!)\nJangan menyerah, coba lagi!';
  }

  @override
  void dispose() {
    _essayController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ShumiColors.background,
      appBar: AppBar(
        title: Text(
          'クイズ (Kuis)',
          style: GoogleFonts.notoSansJp(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        foregroundColor: ShumiColors.textDark,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Center(
              child: Text(
                '${_currentIndex + 1}/${quizQuestions.length}',
                style: GoogleFonts.notoSansJp(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          backgroundImage,
          SafeArea(
            child: Row(
              children: [
                // Left: character + question + feedback
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Memberikan Key unik agar me-refresh bubble & karakter seketika
                          CharacterBubble(
                            key: ValueKey('char_$_currentIndex\$_$_isCorrect'),
                            message: _characterMessage,
                            imagePath: _characterImage,
                            characterHeight: 80,
                          ),
                          const SizedBox(height: 8),

                          // Progress Bar
                          LinearProgressIndicator(
                            value: (_currentIndex + 1) / quizQuestions.length,
                            backgroundColor: ShumiColors.primary.withValues(
                              alpha: 0.1,
                            ),
                            valueColor: const AlwaysStoppedAnimation(
                              ShumiColors.primary,
                            ),
                            borderRadius: BorderRadius.circular(10),
                            minHeight: 6,
                          ),
                          const SizedBox(height: 12),

                          // Question Container
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: ShumiColors.white,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: ShumiColors.primary.withValues(
                                  alpha: 0.2,
                                ),
                              ),
                            ),
                            child: Text(
                              _current.question,
                              style: GoogleFonts.notoSansJp(
                                fontSize: 15,
                                height: 1.5,
                                color: ShumiColors.textDark,
                              ),
                            ),
                          ),

                          // Feedback Box & Next Button
                          if (_isCorrect != null) ...[
                            const SizedBox(height: 12),
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: _isCorrect!
                                    ? ShumiColors.correct.withValues(alpha: 0.1)
                                    : ShumiColors.incorrect.withValues(
                                        alpha: 0.1,
                                      ),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: _isCorrect!
                                      ? ShumiColors.correct
                                      : ShumiColors.incorrect,
                                ),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    _isCorrect!
                                        ? Icons.check_circle
                                        : Icons.cancel,
                                    color: _isCorrect!
                                        ? ShumiColors.correct
                                        : ShumiColors.incorrect,
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      _isCorrect!
                                          ? '正解！ (Benar!)'
                                          : '不正解... Jawaban: ${_current.answer}',
                                      style: GoogleFonts.notoSansJp(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: _isCorrect!
                                            ? ShumiColors.correct
                                            : ShumiColors.incorrect,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 12),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: _next,
                                child: Text(
                                  _currentIndex < quizQuestions.length - 1
                                      ? '次へ'
                                      : 'Skor',
                                  style: GoogleFonts.notoSansJp(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                ),

                // Right: options / essay input
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: _current.type != QuestionType.essay
                        ? ListView.builder(
                            key: ValueKey(
                              'list_$_currentIndex',
                            ), // Reset state list setiap berganti soal
                            physics: const BouncingScrollPhysics(),
                            itemCount: _current.options!.length,
                            itemBuilder: (context, index) {
                              final option = _current.options![index];
                              return QuizOption(
                                key: ValueKey('option_${_currentIndex}_$index'),
                                text: option,
                                isSelected: _selectedAnswer == option,
                                isCorrect: _isCorrect,
                                onTap: () => _onSelect(option),
                                enabled: _isCorrect == null,
                              );
                            },
                          )
                        :
                          // Pada bagian Right: options / essay input
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextField(
                                controller: _essayController,
                                enabled:
                                    _isCorrect ==
                                    null, // Lock input setelah menjawab
                                maxLines: 3,
                                style: GoogleFonts.notoSansJp(fontSize: 16),
                                decoration: InputDecoration(
                                  hintText:
                                      'Tulis jawabanmu dalam Bahasa Indonesia/Jepang...',
                                  hintStyle: GoogleFonts.notoSansJp(
                                    color: ShumiColors.textLight,
                                    fontSize: 14,
                                  ),
                                  filled: true,
                                  fillColor: ShumiColors.white,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(
                                      color: ShumiColors.primary.withValues(
                                        alpha: 0.3,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 12),
                              if (_essayController.text.isNotEmpty)
                                ElevatedButton(
                                  onPressed:
                                      _essayController.text.trim().isNotEmpty
                                      ? () => _onSelect(_essayController.text)
                                      : null,
                                  child: Text(
                                    'Jawab',
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
