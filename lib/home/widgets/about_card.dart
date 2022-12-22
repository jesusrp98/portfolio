import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:layout/layout.dart';
import 'package:portfolio/home/models/experience.dart';
import 'package:portfolio/home/widgets/home_card.dart';

class AboutCard extends StatelessWidget {
  static const _contentHeight = 176.0;

  final Experience experience;

  const AboutCard({
    super.key,
    required this.experience,
  });

  @override
  Widget build(BuildContext context) {
    return HomeCard(
      child: SizedBox(
        height: _contentHeight,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                experience.imagePath,
                height: _contentHeight,
                width: _contentHeight,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    experience.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 26,
                    ),
                  ),
                  ...[
                    for (final detail in experience.details)
                      AutoSizeText(
                        detail,
                        maxLines: 3,
                        style: TextStyle(
                          color: Theme.of(context).textTheme.caption?.color,
                          fontSize: 16,
                        ),
                      ),
                  ],
                ].separate(16),
              ),
            )
          ].separate(24),
        ),
      ),
    );
  }
}
