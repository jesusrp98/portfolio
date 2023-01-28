import 'package:flutter/material.dart';
import 'package:layout/layout.dart';

extension LayoutPhoneExtension on BuildContext {
  bool get isLayoutPhone => breakpoint < LayoutBreakpoint.sm;
}
