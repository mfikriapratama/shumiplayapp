import 'package:flutter/material.dart';
import '../theme.dart';
import '../models/vocabulary.dart';

class VocabularyCard extends StatelessWidget {
  final Vocabulary vocab;
  final VoidCallback? onTap;

  const VocabularyCard({super.key, required this.vocab, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(vocab.japanese,
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                              color: ShumiColors.primary,
                            )),
                    const SizedBox(height: 4),
                    Text(vocab.reading,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: ShumiColors.textLight,
                            )),
                    const SizedBox(height: 4),
                    Text(vocab.meaning,
                        style: Theme.of(context).textTheme.bodyLarge),
                  ],
                ),
              ),
              if (onTap != null)
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: ShumiColors.accent.withValues(alpha: 0.15),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.volume_up, color: ShumiColors.accent),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
