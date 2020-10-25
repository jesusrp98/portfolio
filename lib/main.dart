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
            imageUrl:
                'https://lh3.googleusercontent.com/nH20UXcnThZYJc6GpBIS4eOZF2DD5ivMwRB6H9Y1JWkPz5rip-OGyTrUaFEi-pNOcL9rJKhzZUQi6urNGI5xgcVaFPqMSdW3RSRvngRWflvaTbakGhAPr0dUvb0AuPsSmHNUneZ8DBQxjksSwwn9VmQ0ZvR-7giHq2hkPF4UkOiP0Z1pG5wIedoBJu2V2tHu4E5u7cWz4ewd387_orrTbwutzU4ATdcYmdEIrzBkHrcSqywDRm9ikEG-wwFfvHonYHmRrDOh97OnnZeQclWXOwiNfzPP0jX5HwwbNqhRMJIvwsoj7LGrpT5tsNf5NtxvFYAknpd8PQhbpD8wZBTOnBETpXksZqAH15J9aOIn2Dw5yDvv_UKx90i_cwOVCDV71EucFVcw0eOXp3p_ONgHAVHCZXm5yD0y2tr8tsUxFL8I8rZNWt1FONGZr37LMEoY66o3urgLnLiE9tqM_KPnDPfPacJVglf4ZVSo8TN73VOz-4gXF19Pa1h7ojqUvxRQuooM0vMhsSTwO5IG_HZ4cO-OHYFzFo36Fjli0TlFfzr1SY6tEXEiJf_K5YSKOwhg4pi69Rg0D9xJvERUrjwnyAsqtLvks610tIdaqS69Q_vBypmi_SsfT5D1KybnsVf7YBuu_5VlECbdjHyvE9QoCpIQbuayNyKb0LDpzrh0IjiZH_N-xNVpJizuVeF7XgA=w1756-h1317-no?authuser=0',
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
