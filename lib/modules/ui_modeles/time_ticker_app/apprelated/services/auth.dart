import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';

class User {
  final String uid;
  final String displayUrl;
  final String displayName;
  User({
    @required this.uid,
    this.displayUrl,
    this.displayName,
  });
}

abstract class AuthBase {
  Future<User> currentUser();
  Future<User> signInAnonymously();
  Future<void> signOut();
  Stream<User> get onAuthStateChanged;
  Future<User> signInWithGoogle();
  Future<User> signInWithEmailAndPassword(String email, String password);
  Future<User> createInWithEmailAndPassword(String email, String password);
}

class Auth implements AuthBase {
  final _firebaseAuth = FirebaseAuth.instance;

  @override
  Stream<User> get onAuthStateChanged {
    return _firebaseAuth.onAuthStateChanged.map(_userFromFirebaseUser);
  }

  User _userFromFirebaseUser(FirebaseUser _firebaseUser) {
    if (_firebaseUser == null) {
      return null;
    }
    return User(
      uid: _firebaseUser.uid,
      displayName: _firebaseUser.displayName,
      displayUrl: _firebaseUser.photoUrl,
    );
  }

  @override
  Future<User> currentUser() async {
    final user = await _firebaseAuth.currentUser();
    return _userFromFirebaseUser(user);
  }

  @override
  Future<User> signInAnonymously() async {
    final authResult = await _firebaseAuth.signInAnonymously();

    return _userFromFirebaseUser(authResult.user);
  }

  @override
  Future<void> signOut() async {
    final googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
    await _firebaseAuth.signOut();
  }

  @override
  Future<User> signInWithGoogle() async {
    try {
      GoogleSignIn googleSignIn = GoogleSignIn();
      GoogleSignInAccount account = await googleSignIn.signIn();
      if (account != null) {
        GoogleSignInAuthentication authentication =
            await account.authentication;

        if (authentication.idToken != null &&
            authentication.accessToken != null) {
          final response = await _firebaseAuth.signInWithCredential(
            GoogleAuthProvider.getCredential(
                idToken: authentication.idToken,
                accessToken: authentication.accessToken),
          );

          return _userFromFirebaseUser(response.user);
        } else {
          throw PlatformException(
            code: 'ERROR_MISSING_ACCESS_TOKEN',
            message: 'Access token is missing',
          );
        }
      } else {
        throw PlatformException(
          code: 'ERROR_ABORTED_BY_USER',
          message: 'Sign in abort by user',
        );
      }
    } on PlatformException {
      throw PlatformException(
        code: 'ERROR_ABORTED_BY_USER',
        message: 'Sign in abort by user',
      );
    }
  }

  @override
  Future<User> signInWithEmailAndPassword(String email, String password) async {
    final authResult = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);

    return _userFromFirebaseUser(authResult.user);
  }

  @override
  Future<User> createInWithEmailAndPassword(
      String email, String password) async {
    final authResult = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);

    return _userFromFirebaseUser(authResult.user);
  }
}
