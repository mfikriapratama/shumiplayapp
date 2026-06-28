import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme.dart';
import '../data/quiz_data.dart';
import '../models/quiz_question.dart';
import '../widgets/character_bubble.dart';
import '../widgets/quiz_option.dart';
import 'score_page.dart';

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
        _isCorrect = true;
        _score++;
      } else {
        _isCorrect = answer == _current.answer;
        if (_isCorrect!) _score++;
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
        title: Text('クイズ (Kuis)',
            style: GoogleFonts.notoSansJp(fontWeight: FontWeight.bold)),
        backgroundColor: ShumiColors.background,
        foregroundColor: ShumiColors.textDark,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Center(
              child: Text('${_currentIndex + 1}/${quizQuestions.length}',
                  style: GoogleFonts.notoSansJp(
                      fontSize: 16, fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
      body: Row(
        children: [
          // Left: question + feedback
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (_currentIndex == 0)
                    const CharacterBubble(
                      message: '頑張って！ (Semangat!)\nAkhirnya tiba di kuis!',
                      characterHeight: 80,
                    ),
                  const SizedBox(height: 8),
                  // Progress
                  LinearProgressIndicator(
                    value: (_currentIndex + 1) / quizQuestions.length,
                    backgroundColor: ShumiColors.primary.withValues(alpha: 0.1),
                    valueColor:
                        const AlwaysStoppedAnimation(ShumiColors.primary),
                    borderRadius: BorderRadius.circular(10),
                    minHeight: 6,
                  ),
                  const SizedBox(height: 12),
                  // Question
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: ShumiColors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                          color: ShumiColors.primary.withValues(alpha: 0.2)),
                    ),
                    child: Text(_current.question,
                        style: GoogleFonts.notoSansJp(
                            fontSize: 16,
                            height: 1.5,
                            color: ShumiColors.textDark)),
                  ),
                  if (_isCorrect != null) ...[
                    const SizedBox(height: 12),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: _isCorrect!
                            ? ShumiColors.correct.withValues(alpha: 0.1)
                            : ShumiColors.incorrect.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                            color: _isCorrect!
                                ? ShumiColors.correct
                                : ShumiColors.incorrect),
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
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: _isCorrect!
                                      ? ShumiColors.correct
                                      : ShumiColors.incorrect),
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
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
          // Right: options
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: _current.type != QuestionType.essay
                  ? ListView.builder(
                      itemCount: _current.options!.length,
                      itemBuilder: (context, index) {
                        final option = _current.options![index];
                        return QuizOption(
                          text: option,
                          isSelected: _selectedAnswer == option,
                          isCorrect: _isCorrect,
                          onTap: () => _onSelect(option),
                          enabled: _isCorrect == null,
                        );
                      },
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextField(
                          controller: _essayController,
                          maxLines: 3,
                          style: GoogleFonts.notoSansJp(fontSize: 16),
                          decoration: InputDecoration(
                            hintText: 'Jawabanmu...',
                            hintStyle: GoogleFonts.notoSansJp(
                                color: ShumiColors.textLight),
                            filled: true,
                            fillColor: ShumiColors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                  color: ShumiColors.primary
                                      .withValues(alpha: 0.3)),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        ElevatedButton(
                          onPressed:
                              _isCorrect == null &&
                                      _essayController.text.isNotEmpty
                                  ? () => _onSelect(_essayController.text)
                                  : null,
                          child: Text('Jawab',
                              style: GoogleFonts.notoSansJp(
                                  fontWeight: FontWeight.bold)),
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
