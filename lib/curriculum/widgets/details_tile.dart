import 'package:flutter/material.dart';

class DetailsTile extends StatelessWidget {
  final Widget leading;
  final String title;
  final VoidCallback? onTap;

  const DetailsTile({
    super.key,
    required this.leading,
    required this.title,
    this.onTap,
  });

  factory DetailsTile.asset({
    required String imagePath,
    required String title,
    VoidCallback? onTap,
  }) {
    return DetailsTile(
      leading: Padding(
        padding: const EdgeInsets.all(3),
        child: Image.asset(imagePath),
      ),
      title: title,
      onTap: onTap,
    );
  }

  factory DetailsTile.icon({
    required IconData icon,
    required String title,
    VoidCallback? onTap,
  }) {
    return DetailsTile(
      leading: Icon(icon),
      title: title,
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    final child = IconTheme.merge(
      data: const IconThemeData(size: 18),
      child: Row(
        children: [
          SizedBox.square(
            dimension: 24,
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
      ),
    );

    if (onTap != null) {
      return GestureDetector(
        onTap: onTap,
        child: child,
      );
    }

    return child;
  }
}
