import 'package:flutter/material.dart';
import 'package:dream_come_true/double_color_ball_page.dart';
import 'package:dream_come_true/seven_star_color_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("首页"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const DoubleColorBallPage();
                }));
              },
              child: const Text("双色球"),
            ),
            //间距
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const SevenStarColorPage();
                }));

              },
              child: const Text("七星彩"),
            ),
            const SizedBox(
              height: 20,
            ),
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.pushNamed(context, "/intensify_mock");
            //   },
            //   child: const Text("强化模拟"),
            // ),
          ],
        ),
      ),
    );


  }
}
