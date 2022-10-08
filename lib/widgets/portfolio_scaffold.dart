import 'package:flutter/material.dart';

class PortfolioScaffold extends StatelessWidget {
  final Widget appBar;
  final Widget? body;
  final Widget? bottomBar;

  const PortfolioScaffold({
    super.key,
    required this.appBar,
    this.body,
    this.bottomBar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          appBar,
          if (body != null)
            SliverPadding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).padding.bottom,
              ),
              sliver: body,
            ),
        ],
      ),
      bottomNavigationBar: bottomBar,
    );
  }
}
