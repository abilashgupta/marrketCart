// import 'package:firebase/firebase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:market_cart/app/app.locator.dart';
import 'package:market_cart/app/app.router.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@LazySingleton()
class AuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final _navigator = locator<NavigationService>();
  Future<User?> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    try {
      UserCredential currentUser =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print('Signed Up');
      return currentUser.user;
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }

  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential currentUser =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print('Signed In');

      return currentUser.user;
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }

  Future statusOfUser(User user) async {
    _firebaseAuth.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
        _navigator.replaceWith(Routes.dashboard);
      }
    });
  }

  Future<String?> signOut() async {
    await _firebaseAuth.signOut();
  }
}
