import 'package:flutter/material.dart';
import '../theme.dart';

class QuizOption extends StatelessWidget {
  final String text;
  final bool isSelected;
  final bool? isCorrect;
  final VoidCallback onTap;
  final bool enabled;

  const QuizOption({
    super.key,
    required this.text,
    this.isSelected = false,
    this.isCorrect,
    required this.onTap,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    Color bgColor = ShumiColors.white;
    Color borderColor = ShumiColors.primary.withValues(alpha: 0.3);
    Color textColor = ShumiColors.textDark;

    if (isSelected && isCorrect == true) {
      bgColor = ShumiColors.correct.withValues(alpha: 0.1);
      borderColor = ShumiColors.correct;
      textColor = ShumiColors.correct;
    } else if (isSelected && isCorrect == false) {
      bgColor = ShumiColors.incorrect.withValues(alpha: 0.1);
      borderColor = ShumiColors.incorrect;
      textColor = ShumiColors.incorrect;
    } else if (isSelected) {
      bgColor = ShumiColors.primary.withValues(alpha: 0.1);
      borderColor = ShumiColors.primary;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: enabled ? onTap : null,
          borderRadius: BorderRadius.circular(12),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: borderColor, width: 2),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(text,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: textColor,
                            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                          )),
                ),
                if (isSelected && isCorrect == true)
                  const Icon(Icons.check_circle, color: ShumiColors.correct),
                if (isSelected && isCorrect == false)
                  const Icon(Icons.cancel, color: ShumiColors.incorrect),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
