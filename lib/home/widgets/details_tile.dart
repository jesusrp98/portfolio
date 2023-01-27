import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

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
            color: Theme.of(context).colorScheme.onSurfaceVariant,
            size: 32,
          ),
          child: SizedBox.square(
            dimension: 40,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: leading,
            ),
          ),
        ),
        const Gap(12),
        Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}
