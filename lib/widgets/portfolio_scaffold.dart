import 'package:flutter/material.dart';
import 'package:portfolio/utils/app_colors.dart';

class PortfolioScaffold extends StatelessWidget {
  final Widget appBar;
  final Widget? drawer;
  final Widget? body;
  final Widget? bottomBar;

  const PortfolioScaffold({
    super.key,
    required this.appBar,
    this.drawer,
    this.body,
    this.bottomBar,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        scaffoldBackgroundColor: Theme.of(context).brightness == Brightness.dark
            ? AppColors.darkScaffoldColor
            : null,
      ),
      child: Scaffold(
        drawer: drawer,
        body: CustomScrollView(
          slivers: [
            appBar,
            if (body != null)
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(
                  top: 16,
                  bottom: MediaQuery.of(context).padding.bottom,
                ),
                sliver: body,
              ),
          ],
        ),
        bottomNavigationBar: bottomBar,
      ),
    );
  }
}
