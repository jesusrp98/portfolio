import 'package:flutter/material.dart';
import 'package:portfolio/home/pages/home_page.dart';
import 'package:portfolio/resume/utils/personal_info.dart';

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
            padding: const EdgeInsets.all(16).copyWith(bottom: 12),
            child: Text(
              PersonalInfo.name,
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          const Divider(),
          for (final tab in HomeTabs.values)
            ListTile(
              title: Text(
                tab.toNavigationString(),
                style: Theme.of(context).textTheme.headline6,
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
