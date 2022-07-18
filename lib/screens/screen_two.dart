import 'package:flutter/material.dart';
import 'package:state_managers/models/user.dart';
import 'package:state_managers/services/user_service.dart';

class ScreenTwoScreen extends StatelessWidget {
  const ScreenTwoScreen({Key? key}) : super(key: key);

  static const routeName = '/screen_two';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder(
          stream: userService.userStream,
          builder: (_, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return Text('${snapshot.data.name}');
            }
            return const Text('No user');
          },
        ),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          MaterialButton(
              color: Colors.blue,
              onPressed: () {
                userService.loadUser(User(name: 'Geisson', age: 20));
              },
              child: const Text(
                'Set username',
                style: TextStyle(
                  color: Colors.white,
                ),
              )),
          MaterialButton(
              color: Colors.blue,
              onPressed: () {
                userService.loadAge(21);
              },
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
