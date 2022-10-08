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
      expandedHeight: null,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      titleTextStyle: Theme.of(context).textTheme.headline6,
    );
  }
}
