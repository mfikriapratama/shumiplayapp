import '../models/quiz_question.dart';

const quizQuestions = [
  QuizQuestion(
    question: 'Kata "どくしょ" artinya apa?',
    type: QuestionType.multipleChoice,
    options: ['Membaca', 'Menggambar', 'Olahraga', 'Memasak'],
    answer: 'Membaca',
    hint: 'Kegiatan membaca buku',
  ),
  QuizQuestion(
    question: 'Lengkapi kalimat:\n「わたしのしゅみは＿＿＿です。」\n(Hobi saya adalah ...)',
    type: QuestionType.fillBlank,
    options: ['どくしょ', 'スポーツ', 'えをかくこと', 'りょこう'],
    answer: 'どくしょ',
    hint: 'Pilih kosakata hobi yang tepat',
  ),
  QuizQuestion(
    question: 'Lengkapi kalimat:\n「わたしのしゅみは ＿＿＿ です。」\nGunakan pola jawab yang benar.',
    type: QuestionType.fillBlank,
    options: ['なんですか', 'わたしのしゅみは', 'がすきです', 'をします'],
    answer: 'わたしのしゅみは',
    hint: 'Pola jawab: わたしのしゅみは [hobi] です',
  ),
  QuizQuestion(
    question: '「どんな＿＿＿がすきですか。」\n(Olahraga seperti apa yang kamu suka?)',
    type: QuestionType.fillBlank,
    options: ['スポーツ', 'おんがく', 'りょうり', 'りょこう'],
    answer: 'スポーツ',
    hint: 'Jawab dengan genre spesifik',
  ),
  QuizQuestion(
    question: 'Buatlah dialog:\nA: しゅみは なんですか。\nB: わたしのしゅみは ＿＿＿ です。\nA: どんな ＿＿＿ が すきですか。\nB: わたしは ＿＿＿ が すきです。',
    type: QuestionType.essay,
    answer: 'any',
    hint: 'Isi dengan hobi dan genre favoritmu',
  ),
];
