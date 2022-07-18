import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_managers/models/user.dart';
import 'package:state_managers/services/user_service.dart';

class ScreenTwoScreen extends StatelessWidget {
  const ScreenTwoScreen({Key? key}) : super(key: key);

  static const routeName = '/screen_two';

  @override
  Widget build(BuildContext context) {
    final UserService userService = Provider.of<UserService>(context);

    return Scaffold(
      appBar: AppBar(
        title: userService.existsUser
            ? Text(userService.user!.name)
            : const Text('Not user yet'),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          MaterialButton(
              color: Colors.blue,
              onPressed: () {
                userService.setUser(User(
                    name: 'John', age: 30, carrers: ['Developer', 'Designer']));
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
                userService.setAge(40);
              },
              child: const Text(
                'Change user\'s age',
                style: TextStyle(
                  color: Colors.white,
                ),
              )),
          MaterialButton(
              color: Colors.blue,
              onPressed: () {
                userService.addCarrer();
              },
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
