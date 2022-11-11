import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:layout/layout.dart';
import 'package:portfolio/utils/urls.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ContactActions extends StatelessWidget {
  final double? iconSize;

  const ContactActions({
    super.key,
    this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    final actions = [
      IconButton(
        tooltip: 'Email',
        icon: const Icon(Icons.email_rounded),
        onPressed: () => launchUrlString(Urls.email),
      ),
      IconButton(
        tooltip: 'LinkedIn',
        icon: const FaIcon(FontAwesomeIcons.linkedin),
        onPressed: () => launchUrlString(Urls.linkedIn),
      ),
      IconButton(
        tooltip: 'GitHub',
        icon: const FaIcon(FontAwesomeIcons.github),
        onPressed: () => launchUrlString(Urls.gitHub),
      ),
    ];

    if (iconSize != null) {
      return IconTheme.merge(
        data: IconThemeData(size: iconSize),
        child: Row(
          children: actions.separate(iconSize! / 2),
        ),
      );
    }

    return Row(
      children: actions.separate(12),
    );
  }
}
