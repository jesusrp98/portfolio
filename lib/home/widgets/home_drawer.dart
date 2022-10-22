import 'package:flutter/material.dart';
import 'package:portfolio/resume/utils/personal_info.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Text(
              PersonalInfo.name,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          ListTile(
            title: const Text('Home'),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            title: const Text('About'),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            title: const Text('Resume'),
            onTap: () {
              Navigator.of(context).pop();
              launchUrlString('${Uri.base}resume');
            },
          ),
        ],
      ),
    );
  }
}
