import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  // Google sign in method
  Future<UserCredential?> signInWithGoogle() async {
    // Begin the interactive sign-in process
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    // If the user cancels the Google sign-in pop-up
    if (gUser == null) return null;

    // Obtain the authentication details from the Google sign-in request
    final GoogleSignInAuthentication gAuth = await gUser.authentication;

    // Create a new credential using the token received
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );

    // Finally, sign in the user using Firebase Authentication
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}

