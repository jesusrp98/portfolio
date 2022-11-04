import 'package:flutter/material.dart';

class PortfolioAppBar extends StatelessWidget {
  final Widget? title;
  final List<Widget>? actions;

  const PortfolioAppBar({
    super.key,
    this.title,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      stretch: true,
      title: title,
      actions: actions,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      foregroundColor: Theme.of(context).textTheme.headline6?.color,
      titleTextStyle: Theme.of(context).textTheme.headline6,
    );
  }
}
