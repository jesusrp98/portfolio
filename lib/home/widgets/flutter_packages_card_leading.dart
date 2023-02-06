import 'package:flutter/material.dart';
import 'package:grid_point_4/grid_point_4.dart';
import 'package:layout/layout.dart';

class FlutterPackagesCardLeading extends StatelessWidget {
  const FlutterPackagesCardLeading({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Theme.of(context).colorScheme.secondaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(GridSpacing.s24),
        child: IconTheme.merge(
          data: IconThemeData(
            color: Theme.of(context).colorScheme.onSecondaryContainer,
            size: GridSpacing.s48,
          ),
          child: FittedBox(
            fit: BoxFit.none,
            child: Column(
              children: [
                Row(
                  children: [
                    const Icon(Icons.inventory_2_rounded),
                    const Icon(Icons.public_rounded),
                    const Icon(Icons.layers_rounded),
                    const Icon(Icons.data_object_rounded),
                    const Icon(Icons.bluetooth_rounded),
                  ].separate(GridSpacing.s24),
                ),
                Row(
                  children: [
                    const Icon(Icons.contactless_rounded),
                    const Icon(Icons.piano_rounded),
                    const Icon(Icons.highlight_rounded),
                    const Icon(Icons.android_rounded),
                    const Icon(Icons.tune_rounded),
                  ].separate(GridSpacing.s24),
                ),
                Row(
                  children: [
                    const Icon(Icons.ads_click_rounded),
                    const Icon(Icons.usb_rounded),
                    const Icon(Icons.location_on_rounded),
                    const Icon(Icons.touch_app_rounded),
                    const Icon(Icons.volunteer_activism_rounded),
                  ].separate(GridSpacing.s24),
                ),
              ].separate(GridSpacing.s24),
            ),
          ),
        ),
      ),
    );
  }
}
