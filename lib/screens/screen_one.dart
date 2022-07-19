import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_managers/bloc/user/user_cubit.dart';
import 'package:state_managers/models/user.dart';
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
      body: BlocBuilder<UserCubit, UserState>(
        builder: (_, state) {
          if (state is UserInitial) {
            return const Center(
              child: Text('No user'),
            );
          } else if (state is ActiveUser) {
            return _UserInfo(state.user);
          }
          return const Center(
            child: Text('Unknown state'),
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
  const _UserInfo(
    this.user, {
    Key? key,
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
          title: Text('Name ${user.name}'),
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
        Divider(),
        ...user.careers!.map(
          (career) => ListTile(
            title: Text(career),
          ),
        ),
      ]),
    );
  }
}
