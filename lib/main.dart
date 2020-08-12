import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Parallax',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double opac = 0.1;
  double pos = -100;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener(
        onNotification: (notification) {
          if (notification is ScrollUpdateNotification) {
            setState(() {
              opac = opac + notification.scrollDelta / 200;
              pos = pos + notification.scrollDelta / 2;
              if (opac <= 1 && opac >= 0.1)
                opac = opac;
              else if (opac < 0.1)
                opac = 0.1;
              else
                opac = 1;
              if (pos >= -100 && pos <= 0)
                pos = pos;
              else if (pos < -100)
                pos = -100;
              else
                pos = 0;
            });
          }
        },
        child: Stack(children: [
          Opacity(
            opacity: opac,
            child: Container(
              height: 500,
              width: double.infinity,
              child: Image.asset(
                'assets/images/image1.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: 500,
            width: double.infinity,
            child: Image.asset(
              'assets/images/image2.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
              child: Container(
                height: 500,
                child: Image.asset(
                  'assets/images/image3.png',
                ),
              ),
              left: pos),
          ListView(
            children: [
              Container(
                height: 1200,
                color: Colors.transparent,
              ),
            ],
          )
        ]),
      ),
    );
  }
}
