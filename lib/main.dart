import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_managers/screens/screens.dart';
import 'package:state_managers/services/user_service.dart';

void main() => runApp(const StatesApp());

class StatesApp extends StatelessWidget {
  const StatesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserService>(
          create: (_) => UserService(),
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
