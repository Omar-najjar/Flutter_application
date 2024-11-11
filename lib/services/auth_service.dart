import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  // Google Sign In
  Future<User?> signInWithGoogle() async {
    // Début du processus de connexion
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    // Détails d'authentification de la demande
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    // Création d'une nouvelle instance d'authentification
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );

    // Connexion avec les informations d'identification de Google
    UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
    return userCredential.user;
  }
}
