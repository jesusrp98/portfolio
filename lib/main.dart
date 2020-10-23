import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfolio',
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

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Row(
            children: [
              Expanded(
                child: SizedBox(),
              ),
              Expanded(
                child: Image.network(
                  'https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fnews.stanford.edu%2Fthedish%2Fwp-content%2Fuploads%2Fsites%2F2%2F2016%2F10%2FDecker.jpg&f=1&nofb=1',
                  fit: BoxFit.cover,
                  height: double.infinity,
                ),
              ),
            ],
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
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(children: [
                  Text(
                    'Jesus',
                    style: TextStyle(
                      fontSize: 72,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ]),
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
          ),
        ],
      ),
    );
  }
}
