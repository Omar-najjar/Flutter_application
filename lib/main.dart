import 'package:crud_tuto/firebase_options.dart';
import 'package:crud_tuto/pages/auth_page.dart';
import 'package:crud_tuto/pages/login_or_register_page.dart';
import 'package:crud_tuto/pages/menu_page.dart';
import 'package:crud_tuto/themes/theme_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform);
  runApp(
      ChangeNotifierProvider(create: (context)=> ThemeProvider(),
      child: const MainApp(),)

  );
}
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginOrRegisterPage(),

      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}