import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/ui/pages/index.dart';

import 'ui/widgets/index.dart';
import 'services/index.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jesus Rodriguez',
      theme: ThemeData(
        brightness: Brightness.dark,
        textTheme: GoogleFonts.robotoMonoTextTheme(
          ThemeData.dark().textTheme,
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int index = 0;

  final List<Widget> pages = [
    WhoPage(),
    WhatPage(),
    HowPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FadedBackground(
            image: 'assets/images/who.jpg',
          ),
          Container(
            padding: EdgeInsets.all(64),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
                stops: [0.35, 0.5],
                colors: [
                  Colors.transparent,
                  Color(0xff212121),
                ],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NavigationBar(
                  selectedItem: index,
                  onItemTap: (newIndex) => setState(() => index = newIndex),
                  items: [
                    'WHO',
                    'WHAT',
                    'HOW',
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Jesus',
                      style: TextStyle(
                        fontSize: 72,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Rodriguez',
                      style: TextStyle(
                        fontSize: 72,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Flutter developer',
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.white54,
                      ),
                    ),
                    Text(
                      'UX/UI designer',
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.white54,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      tooltip: 'Twitter',
                      onPressed: () =>
                          'https://twitter.com/jesusrp98'.launchURL(),
                      iconSize: 40,
                      icon: FaIcon(FontAwesomeIcons.twitter),
                    ),
                    SizedBox(width: 16),
                    IconButton(
                      tooltip: 'GitHub',
                      onPressed: () =>
                          'https://github.com/jesusrp98/'.launchURL(),
                      iconSize: 40,
                      icon: FaIcon(FontAwesomeIcons.github),
                    ),
                    SizedBox(width: 16),
                    IconButton(
                      tooltip: 'Email',
                      onPressed: () =>
                          'mailto:jesusrope98@outlook.com'.launchURL(),
                      iconSize: 40,
                      icon: Icon(Icons.email),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
