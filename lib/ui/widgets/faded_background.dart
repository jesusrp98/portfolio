import 'package:flutter/material.dart';

class FadedBackground extends StatelessWidget {
  final String imageUrl;

  const FadedBackground({Key key, this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(),
        ),
        Expanded(
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
            height: double.infinity,
          ),
        ),
      ],
    );
  }
}
