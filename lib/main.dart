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
  MediaQueryData data;
  double opac = 0.1;
  double posleft2 = -200;
  double postop1 = 0;
  double postop2 = 0;
  double postop3 = 0;
  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    return Scaffold(
      body: NotificationListener(
        onNotification: (notification) {
          if (notification is ScrollUpdateNotification) {
            setState(() {
              opac = opac + notification.scrollDelta / 150;
              posleft2 = posleft2 + notification.scrollDelta / 2;
              postop1 = postop1 - notification.scrollDelta / 1;
              postop2 = postop2 - notification.scrollDelta / 1;
              postop3 = postop3 - notification.scrollDelta / 1;
              if (opac <= 1 && opac >= 0.1)
                opac = opac;
              else if (opac < 0.1)
                opac = 0.1;
              else
                opac = 1;
              if (posleft2 >= -200 && posleft2 <= -25)
                posleft2 = posleft2;
              else if (posleft2 < -200)
                posleft2 = -200;
              else
                posleft2 = -25;
            });
          }
        },
        child: Stack(children: [
          Positioned(
            top: postop1,
            child: Opacity(
              opacity: opac,
              child: Container(
                height: 600,
                width: data.size.width,
                child: Image.asset(
                  'assets/images/image1.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            top: postop2,
            child: Container(
              height: 600,
              width: data.size.width,
              child: Image.asset(
                'assets/images/image2.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
              top: postop2,
              child: Container(
                width: data.size.width,
                height: 600,
                child: Image.asset(
                  'assets/images/image3.png',
                ),
              ),
              left: posleft2),
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
