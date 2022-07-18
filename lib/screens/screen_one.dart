import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_managers/models/user.dart';
import 'package:state_managers/screens/screen_two.dart';
import 'package:state_managers/services/user_service.dart';

class ScreenOneScreen extends StatelessWidget {
  const ScreenOneScreen({Key? key}) : super(key: key);

  static const routeName = '/screen_one';

  @override
  Widget build(BuildContext context) {
    final UserService userService = Provider.of<UserService>(context);

    return Scaffold(
      appBar: AppBar(
        title: userService.existsUser
            ? Text(userService.user!.name)
            : const Text('Not user yet'),
        actions: [
          IconButton(
            icon: const Icon(Icons.remove_circle_outline),
            onPressed: () {
              userService.removeUser();
            },
          ),
        ],
      ),
      body: userService.existsUser
          ? _UserInfo(user: userService.user!)
          : const Center(child: Text("Not user")),
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
          title: Text('Name : ${user.name}'),
        ),
        ListTile(
          title: Text('Age : ${user.age}'),
        ),
        const Text(
          'Careers',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 500,
          child: ListView.builder(
            itemCount: user.carrers!.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(user.carrers![index]),
              );
            },
          ),
        ),
      ]),
    );
  }
}
