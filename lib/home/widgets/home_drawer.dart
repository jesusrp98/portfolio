import 'package:flutter/material.dart';
import 'package:portfolio/home/pages/home_page.dart';
import 'package:portfolio/utils/personal_info.dart';

typedef NavigationItemCallback = void Function(
  BuildContext context,
  HomeTabs tab,
);

class HomeDrawer extends StatelessWidget {
  final NavigationItemCallback onNavigationItemTap;

  const HomeDrawer({
    super.key,
    required this.onNavigationItemTap,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              PersonalInfo.name,
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium
                  ?.copyWith(fontWeight: FontWeight.w500),
            ),
          ),
          const Divider(),
          for (final tab in HomeTabs.values)
            ListTile(
              title: Text(
                tab.toNavigationString(),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              onTap: () {
                onNavigationItemTap(context, tab);
                Navigator.of(context).pop();
              },
            ),
        ],
      ),
    );
  }
}
