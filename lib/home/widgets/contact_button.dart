import 'package:flutter/material.dart';
import 'package:grid_point_4/grid_point_4.dart';

class ContactButton extends StatelessWidget {
  final String label;
  final TextStyle? style;
  final VoidCallback onPressed;
  final bool expand;

  const ContactButton({
    required this.label,
    required this.style,
    required this.onPressed,
    required this.expand,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final child = TextButton(
      style: TextButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
        foregroundColor: Theme.of(context).colorScheme.primary,
        textStyle: !expand ? style : null,
      ),
      onPressed: onPressed,
      child: Text(label),
    );

    if (expand) {
      return ConstrainedBox(
        constraints: const BoxConstraints(minWidth: double.infinity),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: GridSpacing.s40),
          child: child,
        ),
      );
    }

    return child;
  }
}
