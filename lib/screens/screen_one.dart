import 'package:flutter/material.dart';
import 'package:state_managers/models/user.dart';
import 'package:state_managers/screens/screen_two.dart';
import 'package:state_managers/services/user_service.dart';

class ScreenOneScreen extends StatelessWidget {
  const ScreenOneScreen({Key? key}) : super(key: key);

  static const routeName = '/screen_one';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ScreenOneScreen'),
      ),
      body: StreamBuilder(
        stream: userService.userStream,
        builder: (_, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? _UserInfo(
                  user: userService.user!,
                )
              : const Center(
                  child: Text('No user'),
                );
        },
      ),
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
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text(
          'General',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Divider(),
        ListTile(
          title: Text('Name: ${user.name}'),
        ),
        ListTile(
          title: Text('Age ${user.age}'),
        ),
        Text(
          'Careers (${user.careers?.length ?? 0})',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const ListTile(
          title: Text('Career 1'),
        ),
        const ListTile(
          title: Text('Career 2'),
        ),
        const ListTile(
          title: Text('Career 3'),
        ),
      ]),
    );
  }
}
