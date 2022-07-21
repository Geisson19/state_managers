import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_managers/bloc/user_bloc.dart';
import 'package:state_managers/models/user.dart';

class ScreenTwoScreen extends StatelessWidget {
  const ScreenTwoScreen({Key? key}) : super(key: key);

  static const routeName = '/screen_two';

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('ScreenTwoScreen'),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          MaterialButton(
              color: Colors.blue,
              onPressed: () {
                final User userToSend = User(name: 'John', age: 30, careers: [
                  'Developer',
                  'Teacher',
                ]);
                userBloc.add(ActivateUser(userToSend));
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
                userBloc.add(ChangeUserAgeEvent(36));
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
                userBloc.add(AddCareerEvent('Full Stack Developer'));
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
