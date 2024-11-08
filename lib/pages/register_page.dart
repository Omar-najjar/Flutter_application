import 'package:crud_tuto/components/my_button.dart';
import 'package:crud_tuto/components/my_textfield.dart';
import 'package:crud_tuto/components/square_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Méthode pour afficher un message d'erreur
  void showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.blue[500],
          title: const Text('Erreur',style: TextStyle(color: Colors.white)),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK',
              style: TextStyle(color: Colors.white),),
              
            ),
          ],
        );
      },
    );
  }

  // Méthode de connexion de l'utilisateur
  Future<void> signUserUp() async {
    // Affichage du cercle de chargement
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return const Center(child: CircularProgressIndicator());
      },
    );


      // try creating the user
    try {
      // Tentative de connexion
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      // Fermer le cercle de chargement après connexion réussie
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      // Fermer le cercle de chargement si une erreur survient
      Navigator.pop(context);

      // Afficher le message d'erreur en fonction du code d'erreur
      if (e.code == 'user-not-found') {
        showErrorDialog('Incorrect Email: The email you entered is not registered.');
      } else if (e.code == 'wrong-password') {
        showErrorDialog('Incorrect Password: The password you entered is incorrect.');
      } else {
        showErrorDialog('Identifiant ou mot de passe invalide !');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 25),
                const Icon(Icons.lock, size: 100),
                const SizedBox(height: 25),
                Text(
                  'Lest\'s create an account for you!',
                  style: TextStyle(color: Colors.grey[700], fontSize: 16),
                ),
                const SizedBox(height: 25),
                MyTextfield(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),
                const SizedBox(height: 10),

                MyTextfield(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),


                const SizedBox(height: 10),

                MyTextfield(
                  controller: passwordController,
                  hintText: 'Confirm Password',
                  obscureText: true,
                ),

                
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forget Password?',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                MyButton(
                  text: "Sign Up",
                  onTap: signUserUp),
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(thickness: 0.5, color: Colors.grey[400]),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Or continue with',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                      Expanded(
                        child: Divider(thickness: 0.5, color: Colors.grey[400]),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SquareTile(ImagePath: 'lib/images/google.png'),
                    const SizedBox(width: 25),
                    SquareTile(ImagePath: 'lib/images/apple.png'),
                  ],
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account ',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4),
                  GestureDetector(
                    onTap: widget.onTap,
                      child: const Text(
                        'Login now',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
