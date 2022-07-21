import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_managers/bloc/user_bloc.dart';
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
        actions: [
          IconButton(
            icon: const Icon(Icons.remove_circle_outline),
            onPressed: () {
              BlocProvider.of<UserBloc>(context, listen: false)
                  .add(RemoveUserEvent());
            },
          )
        ],
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (_, state) {
          return state.existUser
              ? _UserInfo(user: state.user!)
              : const Center(
                  child: Text(
                  'There\'s not selected user',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ));
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
  final User user;

  const _UserInfo({
    Key? key,
    required this.user,
  }) : super(key: key);

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
          title: Text('Name : ${user.name}'),
        ),
        ListTile(
          title: Text('Age : ${user.age}'),
        ),
        Text(
          'Careers : (${user.careers.length})',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Divider(),
        ...user.careers.map(
          (career) => ListTile(
            title: Text(career),
          ),
        ),
      ]),
    );
  }
}
