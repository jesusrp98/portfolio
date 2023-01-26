import 'package:flutter/material.dart';

class DetailsTag extends StatelessWidget {
  final Widget child;

  const DetailsTag({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(99),
        color: Theme.of(context).textTheme.bodySmall?.color?.withOpacity(0.04),
        border: Border.all(
          color:
              Theme.of(context).textTheme.bodySmall!.color!.withOpacity(0.16),
          width: 2,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        child: DefaultTextStyle.merge(
          style: TextStyle(
            color: Theme.of(context).textTheme.bodySmall?.color,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
          child: child,
        ),
      ),
    );
  }
}
