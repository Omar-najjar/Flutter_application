import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_tuto/components/my_drawer.dart';
import 'package:crud_tuto/pages/plat_page.dart';
import 'package:crud_tuto/pages/salade_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'gateau_page.dart';
import 'jus_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? userFirstName;
  @override
  void initState() {
    super.initState();
    _getUserFirstName();
  }

  Future<void> _getUserFirstName() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final userData = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
      setState(() {
        userFirstName = userData['firstName']; // Assurez-vous que 'firstName' correspond au champ que vous avez enregistré
      });
    }
  }


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bonjour ${userFirstName ?? ''}"),
        backgroundColor: Theme.of(context).colorScheme.surface,
        actions: [

        ],
      ),
      drawer: MyDrawer(),
      body:


      ListView(
        padding: const EdgeInsets.all(8),
        children: [
          const SizedBox(height: 30),
          // Exemple de carte de recette
          Card(
            child: ListTile(
              leading: Image.asset(
                'lib/images/plats.jpg', // Chemin vers ton image locale
                width: 300, // Ajuste la taille si nécessaire
                height: 300, // Ajuste la taille si nécessaire
                //fit: BoxFit.cover, // Permet de gérer le redimensionnement de l'image
              ),
              title: const Text("PLATS"),
              subtitle: const Text("Vous trouverez tous les recettes de plats içi !"
                  ),
              onTap: () {
                // Action lors du clic sur une recette


                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context)=>const PlatPage(),
                    )
                );
              },
            ),
          ),
          const SizedBox(height: 30),
          Card(
            child: ListTile(
              leading: Image.asset(
                'lib/images/salades.jpg', // Chemin vers ton image locale
                width: 300, // Ajuste la taille si nécessaire
                height: 300, // Ajuste la taille si nécessaire
               // fit: BoxFit.cover, // Permet de gérer le redimensionnement de l'image
              ),
              title: const Text("SALADES"),
              subtitle: const Text("Vous trouverez tous les recettes de salades içi ! "
              ),
              onTap: () {
                // Action lors du clic sur une recette


                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context)=>const SaladePage(),
                    )
                );
              },
            ),
          ),
          const SizedBox(height: 30),
          Card(
            child: ListTile(
              leading: Image.asset(
                'lib/images/gateau.jpg', // Chemin vers ton image locale
                width: 300, // Ajuste la taille si nécessaire
                height: 300, // Ajuste la taille si nécessaire
                //fit: BoxFit.cover, // Permet de gérer le redimensionnement de l'image
              ),
              title: const Text("GATEAUX"),
              subtitle: const Text("Vous trouverez tous les recettes de gateaux içi !"
              ),
              onTap: () {
                // Action lors du clic sur une recette

                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context)=>const GateauPage(),
                    )
                );
              },
            ),
          ),
          const SizedBox(height: 30),
          Card(
            child: ListTile(
              leading: Image.asset(
                'lib/images/jus.jpg', // Chemin vers ton image locale
                width: 300, // Ajuste la taille si nécessaire
                height: 300, // Ajuste la taille si nécessaire
                //fit: BoxFit.cover, // Permet de gérer le redimensionnement de l'image
              ),
              title: const Text("JUS"),
              subtitle: const Text("Vous trouverez tous les recettes des jus içi !"
              ),
              onTap: () {
                // Action lors du clic sur une recette

                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context)=>const JusPage(),
                    )
                );
              },
            ),
          ),
          // Ajouter plus de cartes ou une boucle pour afficher une liste de recettes
        ],
      ),
    );
  }
}
