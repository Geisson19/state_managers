import 'package:flutter/material.dart';
import 'package:state_managers/screens/screen_two.dart';

class ScreenOneScreen extends StatelessWidget {
  const ScreenOneScreen({Key? key}) : super(key: key);

  static const routeName = '/screen_one';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ScreenOneScreen'),
      ),
      body: const _UserInfo(),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Navigator.pushNamed(context, ScreenTwoScreen.routeName),
        child: const Icon(Icons.navigate_next),
      ),
    );
  }
}

class _UserInfo extends StatelessWidget {
  const _UserInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child:
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
        Text(
          'General',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Divider(),
        ListTile(
          title: Text('Name'),
        ),
        ListTile(
          title: Text('Age'),
        ),
        Text(
          'Careers',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        ListTile(
          title: Text('Career 1'),
        ),
        ListTile(
          title: Text('Career 2'),
        ),
        ListTile(
          title: Text('Career 3'),
        ),
      ]),
    );
  }
}
