import 'package:flutter/material.dart';
import 'package:grid_point_4/grid_point_4.dart';

class DetailsTile extends StatelessWidget {
  final Widget leading;
  final String title;

  const DetailsTile({
    required this.leading,
    required this.title,
    super.key,
  });

  factory DetailsTile.asset({
    required String assetPath,
    required String title,
  }) {
    return DetailsTile(
      leading: Padding(
        padding: const EdgeInsets.all(GridSpacing.s4),
        child: Image.asset(assetPath),
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
            size: GridSpacing.s32,
          ),
          child: SizedBox.square(
            dimension: GridSpacing.s40,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: leading,
            ),
          ),
        ),
        GridSpacing.gap12,
        Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}
