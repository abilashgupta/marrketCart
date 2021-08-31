import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:market_cart/app/app.locator.dart';
import 'package:market_cart/app/app.router.dart';
import 'package:market_cart/services/authentication.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends BaseViewModel {
  final _navigator = locator<NavigationService>();
  final _authenticationService = locator<AuthenticationService>();
  final passwordTextController = TextEditingController();
  final emailTextController = TextEditingController();
  SnackBar get snackbar => _snackBar;
  final _snackBar = SnackBar(
    content: const Text('Enter the Credentials!'),
  );

  void navigateToRegister() {
    _navigator.navigateTo(Routes.register);
  }

  void loginUsingEmail(BuildContext context) async {
    if (emailTextController.text != '' || passwordTextController.text != '') {
      try {
        User? currentUser =
            await _authenticationService.signInWithEmailAndPassword(
          emailTextController.text,
          passwordTextController.text,
        );
        print(currentUser);
        _authenticationService.statusOfUser(currentUser!);
      } on FirebaseException catch (e) {
        print(e.message);
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('${e.message}')));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(_snackBar);
    }
  }
}
