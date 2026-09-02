class Vocabulary {
  final String japanese;
  final String reading;
  final String meaning;
  final String? category;
  final String? soundAsset;

  const Vocabulary({
    required this.japanese,
    required this.reading,
    required this.meaning,
    this.category,
    this.soundAsset,
  });
}