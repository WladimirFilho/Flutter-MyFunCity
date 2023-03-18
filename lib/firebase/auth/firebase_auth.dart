import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  /// initial firebase
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  /// to represent Current user
  User? get currentUser => firebaseAuth.currentUser;

  /// Pipe with the user info that will be changed
  Stream<User?> get authenticationStateChanges =>
      firebaseAuth.authStateChanges();

  /// to sign in
  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    await firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  /// to create a new account
  Future<void> createAccount({
    required String email,
    required String password,
  }) async {
    await firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  /// to sign out
  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }

  Future<void> resetEmail(email) async {
    await firebaseAuth.sendPasswordResetEmail(email: email);
  }
}
