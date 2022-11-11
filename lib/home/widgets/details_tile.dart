import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailsTile extends StatelessWidget {
  final Widget leading;
  final String title;

  const DetailsTile({
    super.key,
    required this.leading,
    required this.title,
  });

  factory DetailsTile.svg({
    required String assetPath,
    required String title,
  }) {
    return DetailsTile(
      leading: Padding(
        padding: const EdgeInsets.all(4),
        child: SvgPicture.asset(assetPath),
      ),
      title: title,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconTheme.merge(
          data: const IconThemeData(color: Colors.black87),
          child: SizedBox.square(
            dimension: 32,
            child: DecoratedBox(
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: leading,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
