import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/text_box.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({super.key});

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  // User Firebase instance
  final currentUser = FirebaseAuth.instance.currentUser!;

  // Variables pour stocker firstname et lastname
  String firstname = "";
  String lastname = "";

  @override
  void initState() {
    super.initState();
    // Charger les données depuis Firestore au démarrage de la page
    loadUserData();
  }

  // Fonction pour récupérer le firstname et lastname depuis Firestore
  Future<void> loadUserData() async {
    try {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser.uid)
          .get();

      setState(() {
        firstname = userDoc['firstname'] ?? "";
        lastname = userDoc['lastname'] ?? "";
      });
    } catch (e) {
      print("Erreur lors de la récupération des données utilisateur : $e");
    }
  }

  // Fonction pour modifier un champ
  Future<void> editField(String field, String newValue) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser.uid)
        .update({field: newValue});
    setState(() {
      if (field == 'firstname') {
        firstname = newValue;
      } else if (field == 'lastname') {
        lastname = newValue;
      }
    });
  }

  // Fonction pour afficher un dialogue de modification
  void showEditDialog(String field, String currentValue) {
    TextEditingController controller = TextEditingController(text: currentValue);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Modifier $field"),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(hintText: "Entrer un nouveau $field"),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Annuler"),
          ),
          TextButton(
            onPressed: () {
              String newValue = controller.text;
              if (newValue.isNotEmpty) {
                editField(field, newValue);
              }
              Navigator.pop(context);
            },
            child: Text("Enregistrer"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Page"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView(
        children: [
          const SizedBox(height: 50),
          const Icon(Icons.person, size: 72),
          const SizedBox(height: 10),
          // User email
          Text(
            currentUser.email!,
            textAlign: TextAlign.center,
            style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
          ),
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Mes informations',
              style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
            ),
          ),
          // Affichage du firstname et lastname depuis Firestore
          MyTextBox(
            text: firstname,
            sectionName: 'Prénom',
            onPressed: () => showEditDialog('firstname', firstname),
          ),
          MyTextBox(
            text: lastname,
            sectionName: 'Nom',
            onPressed: () => showEditDialog('lastname', lastname),
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
