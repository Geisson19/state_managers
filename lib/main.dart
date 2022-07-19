import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_managers/bloc/user/user_cubit.dart';
import 'package:state_managers/screens/screens.dart';

void main() => runApp(const StatesApp());

class StatesApp extends StatelessWidget {
  const StatesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserCubit>(
          create: (context) => UserCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'States App',
        initialRoute: ScreenOneScreen.routeName,
        routes: {
          ScreenOneScreen.routeName: (_) => const ScreenOneScreen(),
          ScreenTwoScreen.routeName: (_) => const ScreenTwoScreen(),
        },
      ),
    );
  }
}
