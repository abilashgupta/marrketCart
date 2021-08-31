import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:market_cart/app/app.locator.dart';
import 'package:market_cart/services/authentication.dart';
import 'package:stacked/stacked.dart';

class RegisterViewModel extends BaseViewModel {
  final _authenticationService = locator<AuthenticationService>();
  final passwordTextController = TextEditingController();
  final nameTextController = TextEditingController();
  final emailTextController = TextEditingController();

  void registerUser() async {
    try {
      User? currentUser =
          await _authenticationService.createUserWithEmailAndPassword(
              emailTextController.text,
              passwordTextController.text,
              nameTextController.text);
      _authenticationService.statusOfUser(currentUser!);
    } on Exception catch (e) {
      print(e.toString());
    }
  }
}
