import 'package:e_commerce_app/common/widgets/bottom_bar.dart';
import 'package:e_commerce_app/features/auth/screens/auth_screen.dart';
import 'package:e_commerce_app/features/auth/services/auth_service.dart';
import 'package:e_commerce_app/provider/user_provider.dart';
import 'package:flutter/material.dart';

import 'package:e_commerce_app/constants/global_variables.dart';
import 'package:e_commerce_app/router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final authService = AuthService();

  @override
  void initState() {
    authService.getUserData(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amazon clone',
      theme: ThemeData(
        scaffoldBackgroundColor: GlobalVariables.backgroundColor,
        colorScheme: const ColorScheme.light(
          primary: GlobalVariables.secondaryColor,
        ),
        appBarTheme: const AppBarTheme(elevation: 0),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: Provider.of<UserProvider>(context).user.token.isNotEmpty
          ? const BottomBar()
          : const AuthScreen(),
    );
  }
}
