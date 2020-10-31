import 'package:flutter/material.dart';

class FadedBackground extends StatelessWidget {
  final String image;

  const FadedBackground({Key key, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(),
        ),
        Expanded(
          child: Image.asset(
            image,
            fit: BoxFit.cover,
            height: double.infinity,
          ),
        ),
      ],
    );
  }
}
