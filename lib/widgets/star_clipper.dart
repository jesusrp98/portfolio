import 'dart:math' as math;
import 'package:flutter/material.dart';

/// The StarClipper creates a star-shaped clipping path.
/// It supports customizable number of points, inner radius ratio,
/// corner radius, and rotation.
class StarClipper extends CustomClipper<Path> {
  /// The number of star tips (for a 5–pointed star, use 5).
  final int points;

  /// The ratio between the inner and outer radii.
  final double innerRadiusRatio;

  /// The amount of rounding on the corners.
  final double cornerRadius;

  /// A value between 0 and 1 that represents the rotation (0 = 0°, 1 = 360°).
  final double rotation;

  const StarClipper({
    this.points = 5,
    this.innerRadiusRatio = 0.5,
    this.cornerRadius = 0.0,
    this.rotation = 0.0,
  });

  @override
  Path getClip(Size size) {
    // Determine the center and outer/inner radii.
    final center = Offset(size.width / 2, size.height / 2);
    final outerRadius = math.min(size.width, size.height) / 2;
    final innerRadius = outerRadius * innerRadiusRatio;

    // Convert the rotation (0 to 1) to radians.
    final rotationAngle = rotation * 2 * math.pi;

    // Compute the star’s vertices.
    final totalVertices = points * 2;
    final vertices = <Offset>[];

    for (var i = 0; i < totalVertices; i++) {
      // Calculate the angle for each vertex:
      // Starting angle is -pi/2 so the star initially points upward.
      // Add the rotationAngle to rotate the shape.
      final angle = (math.pi * i / points) - math.pi / 2 + rotationAngle;
      final radius = i.isEven ? outerRadius : innerRadius;
      final x = center.dx + radius * math.cos(angle);
      final y = center.dy + radius * math.sin(angle);

      vertices.add(Offset(x, y));
    }

    // Build the path—rounded if cornerRadius > 0.
    if (cornerRadius <= 0) {
      return Path()..addPolygon(vertices, true);
    }

    return _buildRoundedPath(vertices, cornerRadius);
  }

  /// Builds a path from [points] by replacing each sharp corner with a
  /// quadratic Bézier curve to simulate rounded corners.
  Path _buildRoundedPath(List<Offset> points, double radius) {
    final path = Path();
    final count = points.length;

    for (var i = 0; i < count; i++) {
      final prev = points[(i - 1 + count) % count];
      final curr = points[i];
      final next = points[(i + 1) % count];

      // Vectors from the current point to the previous and next points.
      final v1 = curr - prev;
      final v2 = next - curr;

      final d1 = v1.distance;
      final d2 = v2.distance;

      // Calculate the angle between v1 and v2.
      var angle = (math.atan2(v1.dy, v1.dx) - math.atan2(v2.dy, v2.dx)).abs();

      if (angle > math.pi) angle = 2 * math.pi - angle;
      final halfAngle = angle / 2;

      // Determine how far along each edge we have to “cut” the corner.
      var offset = radius / math.tan(halfAngle);
      // Ensure the offset does not exceed half the length of either edge.
      offset = math.min(offset, d1 / 2);
      offset = math.min(offset, d2 / 2);

      // Points on the edges at which to start/end the rounded corner.
      final p1 = curr - (v1 * (offset / d1));
      final p2 = curr + (v2 * (offset / d2));

      if (i == 0) {
        path.moveTo(p1.dx, p1.dy);
      } else {
        path.lineTo(p1.dx, p1.dy);
      }
      // Draw a quadratic Bézier from p1 to p2 with the vertex
      // as the control point.
      path.quadraticBezierTo(curr.dx, curr.dy, p2.dx, p2.dy);
    }

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant StarClipper oldClipper) =>
      oldClipper.points != points ||
      oldClipper.innerRadiusRatio != innerRadiusRatio ||
      oldClipper.cornerRadius != cornerRadius ||
      oldClipper.rotation != rotation;
}

/// A custom painter that draws a border around the path produced by [clipper].
class StarBorderPainter extends CustomPainter {
  final StarClipper clipper;
  final Color borderColor;
  final double borderWidth;

  const StarBorderPainter({
    required this.clipper,
    this.borderColor = Colors.black,
    this.borderWidth = 2.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final path = clipper.getClip(size);
    final paint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant StarBorderPainter oldDelegate) =>
      oldDelegate.borderColor != borderColor ||
      oldDelegate.borderWidth != borderWidth ||
      oldDelegate.clipper != clipper;
}
