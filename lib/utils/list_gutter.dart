import 'package:flutter/material.dart';

extension ListGutter on List<Widget> {
  List<Widget> separate({double space = 12}) => length <= 1
      ? this
      : sublist(1).fold(
          [first],
          (r, element) => [...r, SizedBox.square(dimension: space), element],
        );
}
