import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'package:e_commerce_app/constants/global_variables.dart';
import 'package:e_commerce_app/models/user.dart';
import 'package:e_commerce_app/constants/error_handling.dart';
import 'package:e_commerce_app/constants/utils.dart';

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
}
