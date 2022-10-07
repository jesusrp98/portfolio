import 'package:flutter/material.dart';

class DetailsTile extends StatelessWidget {
  final Widget leading;
  final String title;

  const DetailsTile({
    super.key,
    required this.leading,
    required this.title,
  });

  factory DetailsTile.asset({
    required String imagePath,
    required String title,
  }) {
    return DetailsTile(
      leading: Padding(
        padding: const EdgeInsets.all(4),
        child: Image.asset(imagePath),
      ),
      title: title,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox.square(
          dimension: 32,
          child: ClipOval(
            child: DecoratedBox(
              decoration: const BoxDecoration(color: Colors.white),
              child: leading,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
