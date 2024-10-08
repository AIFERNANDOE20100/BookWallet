import 'package:book_wallert/functions/global_user_provider.dart';
import 'package:book_wallert/models/user.dart';
import 'package:flutter/material.dart';
import 'package:book_wallert/services/user_api_service.dart';

class UserController {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  final UserApiService userApiService = UserApiService();

  Future<void> editUserDetails(BuildContext context) async {
    try {
      // print(usernameController.text);
      // print(emailController.text);
      // print(passwordController.text);
      User user = await userApiService.editUserDetailsService(
          usernameController.text,
          emailController.text,
          passwordController.text,
          descriptionController.text);

      setUser(user); // updating the global user object

      if (context.mounted) {
        Navigator.pop(context);
      }
    } catch (e) {
      print(e);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Failed to update'),
          ),
        );
      }
    }
  }
}
