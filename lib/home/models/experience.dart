class Experience {
  final String imagePath;
  final String title;
  final List<String> details;
  final String? subtitle;
  final String? trailing;

  const Experience({
    required this.imagePath,
    required this.title,
    required this.details,
    this.subtitle,
    this.trailing,
  });
}
