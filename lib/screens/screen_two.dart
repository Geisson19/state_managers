import 'package:flutter/material.dart';

class ScreenTwoScreen extends StatelessWidget {
  const ScreenTwoScreen({Key? key}) : super(key: key);

  static const routeName = '/screen_two';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ScreenTwoScreen'),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          MaterialButton(
              color: Colors.blue,
              onPressed: () {},
              child: const Text(
                'Set username',
                style: TextStyle(
                  color: Colors.white,
                ),
              )),
          MaterialButton(
              color: Colors.blue,
              onPressed: () {},
              child: const Text(
                'Change user\'s age',
                style: TextStyle(
                  color: Colors.white,
                ),
              )),
          MaterialButton(
              color: Colors.blue,
              onPressed: () {},
              child: const Text(
                'Add career',
                style: TextStyle(
                  color: Colors.white,
                ),
              )),
        ]),
      ),
    );
  }
}
