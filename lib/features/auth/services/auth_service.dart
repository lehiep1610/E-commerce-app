import 'dart:convert';

import 'package:e_commerce_app/common/widgets/bottom_bar.dart';
import 'package:e_commerce_app/provider/user_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'package:e_commerce_app/constants/global_variables.dart';
import 'package:e_commerce_app/models/user.dart';
import 'package:e_commerce_app/constants/error_handling.dart';
import 'package:e_commerce_app/constants/utils.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  void signUpUser({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      User user = User(
          id: 'id',
          name: name,
          password: password,
          email: email,
          userType: 'userType',
          token: 'token');

      final response = await http.post(Uri.parse('$uri/api/signup'),
          body: user.toJson(),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });

      httpErrorHandle(
          response: response,
          context: context,
          onSuccess: () {
            showSnackBar(
                context, 'Acount created! Login with the same credential!');
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      final response = await http.post(Uri.parse('$uri/api/signin'),
          body: jsonEncode({
            'email': email,
            'password': password,
          }),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });
      httpErrorHandle(
        response: response,
        context: context,
        onSuccess: () async {
          final navigator = Navigator.of(context);
          Provider.of<UserProvider>(context, listen: false)
              .setUser(response.body);
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString(
              'auth-token', json.decode(response.body)['token']);
          navigator.pushNamedAndRemoveUntil(
              BottomBar.routeName, (route) => false);
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void getUserData(BuildContext context) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('auth-token') ?? '';

      final tokenRes = await http.post(
        Uri.parse('$uri/tokenIsValid'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'auth-token': token,
        },
      );

      final response = json.decode(tokenRes.body);
      if (response == true) {
        final userResponse = await http.get(
          Uri.parse('$uri/'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'auth-token': token,
          },
        );

        final userProvider = Provider.of<UserProvider>(context, listen: false);
        userProvider.setUser(userResponse.body);
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
