class Experience {
  final String imagePath;
  final String title;
  final List<String> details;
  final String? subtitle;
  final String? trailing;
  final void Function()? onTap;

  const Experience({
    required this.imagePath,
    required this.title,
    this.details = const [],
    this.subtitle,
    this.trailing,
    this.onTap,
  });
}
