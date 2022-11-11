import 'package:flutter/widgets.dart';

extension SeparateWith on List<Widget> {
  List<Widget> separateWith({required Widget separator}) => length <= 1
      ? this
      : sublist(1).fold(
          [first],
          (r, element) => [...r, separator, element],
        );
}
