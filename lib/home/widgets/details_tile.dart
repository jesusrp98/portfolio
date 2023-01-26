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
        padding: const EdgeInsets.all(5),
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
          data: IconThemeData(
            size: 32,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
          child: SizedBox.square(
            dimension: 40,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceVariant,
                shape: BoxShape.circle,
                border: Theme.of(context).brightness == Brightness.light
                    ? Border.all(color: Colors.black12, width: 2)
                    : null,
              ),
              child: leading,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
