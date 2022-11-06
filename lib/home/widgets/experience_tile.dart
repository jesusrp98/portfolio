import 'package:flutter/material.dart';
import 'package:portfolio/home/models/experience.dart';
import 'package:portfolio/home/widgets/details_tag.dart';

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
            foregroundImage: AssetImage(experience.imagePath),
            radius: 24,
          ),
          title: Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Text(
              experience.company.toUpperCase(),
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
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
          trailing: DetailsTag(
            child: Text(experience.period),
          ),
        ),
        for (final task in experience.tasks)
          Text(
            '· $task',
            style: TextStyle(
              color: Theme.of(context).textTheme.caption?.color,
              fontSize: 16,
              height: 32 / 16,
            ),
          )
      ],
    );
  }
}
