import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:grid_point_4/grid_point_4.dart';
import 'package:pub_api_client/pub_api_client.dart';

class FlutterPackageTile extends StatelessWidget {
  final PubPackage package;
  final Widget? example;

  const FlutterPackageTile({
    super.key,
    required this.package,
    this.example,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: AutoSizeText(
            package.name,
            maxLines: 2,
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontWeight: FontWeight.w500),
          ),
          subtitle: Text(
            package.description,
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(fontWeight: FontWeight.normal),
          ),
          trailing: Icon(
            Icons.launch_rounded,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        if (example != null) ...[
          const Divider(),
          example!,
        ]
      ].separateWith(GridSpacing.gap8),
    );
  }
}
