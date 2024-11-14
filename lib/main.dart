import 'package:crud_tuto/firebase_options.dart';
import 'package:crud_tuto/pages/auth_page.dart';
import 'package:crud_tuto/pages/home_page.dart';
import 'package:crud_tuto/pages/login_or_register_page.dart';
import 'package:crud_tuto/pages/menu_page.dart';
import 'package:crud_tuto/themes/theme_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';  // Importer Firebase Auth
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).themeData,
      // Vérifier si un utilisateur est connecté pour rediriger vers la page appropriée
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(), // Surveille l'état de l'authentification
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              // Si l'utilisateur est connecté, redirige vers la page d'accueil (MenuPage)
              return const HomePage();
            } else {
              // Sinon, redirige vers la page de login ou d'enregistrement
              return const LoginOrRegisterPage();
            }
          }
          // Afficher un indicateur de chargement pendant le processus de connexion
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
