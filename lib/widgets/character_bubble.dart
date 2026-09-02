import 'package:flutter/material.dart';
import '../theme.dart';

class CharacterBubble extends StatelessWidget {
  final String message;
  final bool showCharacter;
  final double characterHeight;
  final String? imagePath;

  const CharacterBubble({
    super.key,
    required this.message,
    this.showCharacter = true,
    this.characterHeight = 180,
    this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    final currentImagePath = imagePath ?? 'assets/images/character.png';

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (showCharacter)
          Image.asset(
            currentImagePath,
            key: ValueKey(
              currentImagePath,
            ), // Memaksa Flutter render ulang gambar saat path berubah
            height: characterHeight,
            fit: BoxFit.contain,
          ),
        if (showCharacter) const SizedBox(width: 8),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              color: ShumiColors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: ShumiColors.primary.withValues(alpha: 0.3),
                width: 2,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Text(
              message,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: ShumiColors.textDark,
                height: 1.5,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
