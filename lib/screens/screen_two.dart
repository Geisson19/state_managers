import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_managers/bloc/user/user_cubit.dart';
import 'package:state_managers/models/user.dart';

class ScreenTwoScreen extends StatelessWidget {
  const ScreenTwoScreen({Key? key}) : super(key: key);

  static const routeName = '/screen_two';

  @override
  Widget build(BuildContext context) {
    final userCubit = BlocProvider.of<UserCubit>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('ScreenTwoScreen'),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          MaterialButton(
              color: Colors.blue,
              onPressed: () {
                userCubit.setUser(User(name: 'John Doe', age: 30, careers: [
                  'Developer',
                  'Designer',
                ]));
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
                userCubit.changeUserAge(40);
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
                userCubit.addCareer();
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
