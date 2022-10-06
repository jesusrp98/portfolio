import 'package:flutter/material.dart';
import 'package:portfolio/curriculum/models/experience.dart';

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
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: Text(
            experience.position,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).textTheme.caption?.color,
            ),
          ),
          trailing: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(99),
              color: Colors.black.withOpacity(0.08),
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
              fontSize: 16,
              color: Theme.of(context).textTheme.caption?.color,
            ),
          )
      ],
    );
  }
}
