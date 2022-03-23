import "package:firebase_auth/firebase_auth.dart";
import "package:cloud_firestore/cloud_firestore.dart";

class AuthService {
  static FirebaseAuth instance = FirebaseAuth.instance;
  static FirebaseFirestore firestoreInstance = FirebaseFirestore.instance;

  static Future<void> createUserAccount(
      String username, String email, String password) async {
    try {
      UserCredential user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      await firestoreInstance.collection('users').doc(user.user?.uid).set({
        'username': username,
        'avatar_url': 'something weird',
        'balance': 300,
        'is_engaged': true,
        'battle_xp': 10000
      });
    } on FirebaseAuthException catch (error) {
      if (error.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (error.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (error) {
      print('Something went absolutely wrong');
      print(error);
    }
  }

  static Future<void> logUserIn(String email, String password) async {
    try {
      UserCredential login = await instance.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (error) {
      if (error.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (error.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    } catch (error) {
      print('something broke again');
    }
  }

  static Stream listenForAuthStateChange() {
    return instance.authStateChanges();
  }
}
