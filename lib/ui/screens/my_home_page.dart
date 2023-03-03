import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// This screen will show on screen
class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final double fontsize = 36;
  final double scale = 2;

  final double max = 1000;
  double highet = 1000;
  double width = 1000;
  Duration duration = const Duration(milliseconds: 1100);
  Color color = const Color.fromRGBO(255, 255, 255, 1);
  Color backgroundcolor = const Color.fromRGBO(255, 255, 255, 1);
  Color invertedcolor = const Color.fromRGBO(0, 0, 0, 1);

  Future<void> animate() async {
    setState(() {
      duration = const Duration(milliseconds: 750);
      width = 0;
      highet = MediaQuery.of(context).size.height;
    });
    changeColor();
    await HapticFeedback.vibrate();

    await Future<void>.delayed(const Duration(milliseconds: 750));
    invertedcolor = Color.fromRGBO(
      invertcolor(backgroundcolor.red),
      invertcolor(backgroundcolor.green),
      invertcolor(backgroundcolor.blue),
      1,
    );

    changeBackgroundColor();

    setState(() {
      duration = Duration.zero;

      width = MediaQuery.of(context).size.width;
      highet = MediaQuery.of(context).size.height;
    });
  }

  int getRandomNumber() {
    final Random random = Random();
    final int randomNumber = random.nextInt(255);

    return randomNumber;
  }

  int invertcolor(int value) {
    const int maxcolornumber = 256;

    return maxcolornumber - value;
  }

  void changeColor() {
    setState(() {
      backgroundcolor = Color.fromRGBO(
        getRandomNumber(),
        getRandomNumber(),
        getRandomNumber(),
        1,
      );
    });
  }

  void changeBackgroundColor() {
    setState(() {
      color = backgroundcolor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundcolor,
      body: GestureDetector(
        onTap: animate,
        child: Stack(
          children: [
            AnimatedContainer(
              height: highet,
              width: width,
              duration: duration,
              decoration: BoxDecoration(
                color: color,
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Hey there',
                    style: TextStyle(fontSize: fontsize, color: invertedcolor),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
