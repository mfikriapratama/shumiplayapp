enum QuestionType { multipleChoice, fillBlank, essay }

class QuizQuestion {
  final String question;
  final QuestionType type;
  final List<String>? options;
  final String answer;
  final String? hint;

  const QuizQuestion({
    required this.question,
    required this.type,
    this.options,
    required this.answer,
    this.hint,
  });
}
