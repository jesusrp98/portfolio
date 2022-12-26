import 'package:flutter/material.dart';
import 'package:layout/layout.dart';
import 'package:portfolio/home/models/experience.dart';
import 'package:portfolio/home/widgets/home_card.dart';

class AboutCard extends StatelessWidget {
  static const _imageDimension = 164.0;

  final Experience experience;

  const AboutCard({
    super.key,
    required this.experience,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: _imageDimension),
      child: HomeCard(
        padding: EdgeInsets.zero,
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                experience.imagePath,
                width: _imageDimension,
                fit: BoxFit.cover,
              ),
              Expanded(
                child: Padding(
                  padding: HomeCard.resolvePadding(context),
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
                          Text(
                            detail,
                            style: TextStyle(
                              color: Theme.of(context).textTheme.caption?.color,
                              fontSize: 18,
                            ),
                          ),
                      ],
                    ].separate(16),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
