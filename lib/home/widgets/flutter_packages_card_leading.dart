import 'package:flutter/material.dart';
import 'package:grid_point_4/grid_point_4.dart';
import 'package:layout/layout.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

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
            child: IconTheme.merge(
              data: const IconThemeData(fill: 1),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Icon(Symbols.inventory_2_rounded),
                      const Icon(Symbols.public_rounded),
                      const Icon(Symbols.layers_rounded),
                      const Icon(Symbols.data_object_rounded),
                      const Icon(Symbols.bluetooth_rounded),
                    ].separate(GridSpacing.s24),
                  ),
                  Row(
                    children: [
                      const Icon(Symbols.contactless_rounded),
                      const Icon(Symbols.piano_rounded),
                      const Icon(Symbols.highlight_rounded),
                      const Icon(Symbols.android_rounded),
                      const Icon(Symbols.tune_rounded),
                    ].separate(GridSpacing.s24),
                  ),
                  Row(
                    children: [
                      const Icon(Symbols.ads_click_rounded),
                      const Icon(Symbols.usb_rounded),
                      const Icon(Symbols.location_on_rounded),
                      const Icon(Symbols.touch_app_rounded),
                      const Icon(Symbols.volunteer_activism_rounded),
                    ].separate(GridSpacing.s24),
                  ),
                ].separate(GridSpacing.s24),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
