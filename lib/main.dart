import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:portfolio/app.dart';
import 'package:pub_api_client/pub_api_client.dart';

void main() {
  usePathUrlStrategy();

  return runApp(
    PortfolioApp(
      pubClient: PubClient(),
    ),
  );
}
