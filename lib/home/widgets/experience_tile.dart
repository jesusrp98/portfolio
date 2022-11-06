import 'package:flutter/material.dart';
import 'package:portfolio/home/models/experience.dart';

class ExperienceTile extends StatelessWidget {
  final Experience experience;

  const ExperienceTile({
    super.key,
    required this.experience,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: CircleAvatar(
            backgroundImage: AssetImage(experience.imagePath),
          ),
          title: Text(
            experience.company.toUpperCase(),
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: Text(
            experience.position,
            style: TextStyle(
              color: Theme.of(context).textTheme.caption?.color,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
          trailing: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(99),
              border: Border.all(
                color: Theme.of(context)
                    .textTheme
                    .caption!
                    .color!
                    .withOpacity(0.16),
                width: 2,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              child: Text(
                experience.period,
                style: TextStyle(
                  color: Theme.of(context).textTheme.caption?.color,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
        for (final task in experience.tasks)
          Text(
            '· $task',
            style: TextStyle(
              color: Theme.of(context).textTheme.caption?.color,
              fontSize: 16,
            ),
          )
      ],
    );
  }
}
