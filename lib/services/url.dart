import 'package:url_launcher/url_launcher.dart';

extension UrlLauncher on String {
  launchURL() async {
    if (await canLaunch(this))
      await launch(this);
    else
      throw 'Could not launch $this';
  }
}
