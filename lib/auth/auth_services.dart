import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Create a new user with email and password
  Future<User?> createUserWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result.user; // Return the created user
    } on FirebaseAuthException catch (e) {
      // Handle Firebase-specific exceptions
      switch (e.code) {
        case 'email-already-in-use':
          throw ('The email is already in use by another account.');
        case 'invalid-email':
          throw ('The email address is invalid.');
        case 'weak-password':
          throw ('The password is too weak.');
        default:
          throw ('An unknown error occurred. Please try again.');
      }
    } catch (e) {
      // Handle any other errors
      throw ('An error occurred: ${e.toString()}');
    }
  }

  // Sign in with email and password
  Future<User?> signInWithEmailAndPassword({required String email, required String password}) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result.user; // Return the signed-in user
    } on FirebaseAuthException catch (e) {
      // Handle Firebase-specific exceptions
      switch (e.code) {
        case 'user-not-found':
          throw ('No user found for that email.');
        case 'wrong-password':
          throw ('Wrong password provided for that user.');
        case 'invalid-email':
          throw ('The email address is invalid.');
        default:
          throw ('An unknown error occurred. Please try again.');
      }
    } catch (e) {
      // Handle any other errors
      throw ('An error occurred: ${e.toString()}');
    }
  }
}
